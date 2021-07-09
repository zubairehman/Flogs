import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:pointycastle/block/aes_fast.dart';
import 'package:pointycastle/block/modes/gcm.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:sembast/sembast.dart';

class _GCMEncoder extends Converter<Map<String, dynamic>, String> {
  final random = Random.secure();
  final randomGenerator = SecureRandom('Fortuna');

  final Uint8List key;

  _GCMEncoder(password) : key = base64Decode(password) {
    randomGenerator.seed(KeyParameter(
        Uint8List.fromList(List.generate(32, (n) => random.nextInt(255)))));
  }

  @override
  String convert(Map<String, dynamic> input) {
    final cipher = GCMBlockCipher(AESFastEngine());
    final iv = randomGenerator.nextBytes(96 ~/ 8);
    final encryptionParameters = AEADParameters(
      KeyParameter(key),
      128,
      iv,
      Uint8List(0),
    );
    cipher.init(true, encryptionParameters);

    final encryptedData = cipher.process(utf8.encode(jsonEncode(input)));

    return base64Encode(iv + encryptedData);
  }
}

class _GCMDecoder extends Converter<String, Map<String, dynamic>> {
  final Uint8List key;

  _GCMDecoder(password) : key = base64Decode(password);

  @override
  Map<String, dynamic> convert(String input) {
    final cipher = GCMBlockCipher(AESFastEngine());
    final inputData = base64Decode(input);
    final iv = inputData.sublist(0, 12);
    final data = inputData.sublist(12);

    final decryptionParameters = AEADParameters(
      KeyParameter(key),
      128,
      iv,
      Uint8List(0),
    );
    cipher.init(false, decryptionParameters);

    final decryptedData = cipher.process(data);
    var result = json.decode(utf8.decode(decryptedData));
    if (result is Map) {
      return result.cast<String, dynamic>();
    }
    throw FormatException('invalid input $input');
  }
}

/// Simple encryption codec using AES GCM
/// It requires a password to encrypt/decrypt the data
class _GCMCodec extends Codec<Map<String, dynamic>, String> {
  final _GCMEncoder _encoder;
  final _GCMDecoder _decoder;

  /// A non null [password] to use for the encryption/decryption
  _GCMCodec(String password)
      : _encoder = _GCMEncoder(password),
        _decoder = _GCMDecoder(password);

  @override
  Converter<String, Map<String, dynamic>> get decoder => _decoder;

  @override
  Converter<Map<String, dynamic>, String> get encoder => _encoder;
}

/// Create a codec to use when opening an encrypted sembast database
///
/// The usage is then
///
/// ```dart
/// // Initialize the encryption codec with a user password
/// var codec = getXXTeaSembastCodec(password: '[your_user_password]');
/// // Open the database with the codec
/// Database db = await factory.openDatabase(dbPath, codec: codec);
///
/// // ...your database is ready to use as encrypted
/// ```
SembastCodec getGCMSembastCodec({@required String password}) =>
    SembastCodec(signature: 'aes-gcm', codec: _GCMCodec(password));
