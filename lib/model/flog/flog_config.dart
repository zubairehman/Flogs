import 'package:f_logs/f_logs.dart';

class LogsConfig {
  /// print logs in Logcat
  bool isDebuggable = true;

  /// print logs in Logcat
  bool isDevelopmentDebuggingEnabled = false;

  /// Logs are enabled
  bool isLogsEnabled = true;

  /// Your set of enabled levels, like INFO, WARNING, ERROR, SEVERE, ...
  /// default is all levels (compatibility to previous version)
  List<LogLevel> logLevelsEnabled = [
    LogLevel.ALL,
    LogLevel.TRACE,
    LogLevel.DEBUG,
    LogLevel.INFO,
    LogLevel.WARNING,
    LogLevel.ERROR,
    LogLevel.SEVERE,
    LogLevel.FATAL,
    LogLevel.OFF
  ];

  /// Active log level, lower levels are skipped
  /// default is LogLevel.INFO (compatibility to previous version)
  LogLevel activeLogLevel = LogLevel.INFO;

  /// Like Network, Database, Location etc
  List<String> dataLogTypes = [DataLogType.DEFAULT.toString()];

  /// Default format of '{String}' log data
  FormatType formatType = FormatType.FORMAT_CURLY;

  /// Field order for output
  List<FieldName> fieldOrderFormatCustom = [
    FieldName.CLASSNAME,
    FieldName.METHOD_NAME,
    FieldName.TEXT,
    FieldName.EXCEPTION,
    FieldName.LOG_LEVEL,
    FieldName.TIMESTAMP,
    FieldName.STACKTRACE
  ];

  /// For log field open
  String customOpeningDivider = " ";

  /// For log field close
  String customClosingDivider = " ";

  /// Delimiter for CSV files
  String csvDelimiter = "";

  /// Encryption enabled
  bool encryptionEnabled = false;

  /// Encryption Key
  String encryptionKey = "";

  /// Timestamp format
  String timestampFormat = TimestampFormat.TIME_FORMAT_READABLE;

  /// If true, print empty field if data is missing. fe. {field1} {field2} {} {null} {field5}
  bool printEmpty = false;

  /// Display milliseconds since epoch for timestamp field
  bool millisecondsSinceEpochForTimestamp = false;

  /// If true, removes new line '\n' signs from strings. Usable
  /// if you are parsing logs anywhere else, and you need to keep each entry
  /// in a single line.
  bool removeNewLines = false;
}
