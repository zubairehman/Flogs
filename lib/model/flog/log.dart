import 'package:f_logs/model/flog/log_level.dart';

class Log {
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Log.
  int id;

  String className;
  String methodName;
  String text;
  String timestamp;
  String exception;
  String dataLogType;
  int timeInMillis;
  LogLevel logLevel;

  Log({
    this.className,
    this.methodName,
    this.text,
    this.timestamp,
    this.timeInMillis,
    this.exception,
    this.logLevel,
    this.dataLogType,
  });

  Map<String, dynamic> toMap() {
    return {
      'className': className,
      'methodName': methodName,
      'text': text,
      'timestamp': timestamp,
      'timeInMillis': timeInMillis,
      'exception': exception,
      'dataLogType': dataLogType,
      'logLevel': LogLevelConverter.fromEnumToString(logLevel),
    };
  }

  static Log fromMap(Map<String, dynamic> map) {
    return Log(
      className: map['className'],
      methodName: map['methodName'],
      text: map['text'],
      timestamp: map['timestamp'],
      timeInMillis: map['timeInMillis'],
      exception: map['exception'],
      dataLogType: map['dataLogType'],
      logLevel: LogLevelConverter.fromStringToEnum(map['logLevel']),
    );
  }
}
