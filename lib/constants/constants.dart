class Constants {
  Constants._();

  /// Directory
  static const DIRECTORY_NAME = 'FLogs';

  /// Missing Initialization Exception
  static const EXCEPTION_NOT_INIT =
      // ignore: lines_longer_than_80_chars
      'FLog is not initialized! Please provide FLog configuration by calling FLog.applyConfigurations(LogsConfig config) in your application class';

  /// Encryption key null exception
  static const EXCEPTION_NULL_KEY =
      // ignore: lines_longer_than_80_chars
      'Encryption key is not provided, please provide encryption key in LogsConfig';

  /// Null Logs Level Exception
  static const EXCEPTION_NULL_LOGS_LEVEL =
      // ignore: lines_longer_than_80_chars
      'ActiveLogLevel is not provided or null, please provide activeLogLevel key in LogsConfig';

  // Print Messages
  static const PRINT_EXPORT_MSG =
      // ignore: lines_longer_than_80_chars
      '\n--------------------------------------------------------------------------------------------\nExporting Logs: This might take a while depending upon the size\n--------------------------------------------------------------------------------------------';

  /// Print Log Messages
  static const PRINT_LOG_MSG =
      // ignore: lines_longer_than_80_chars
      '\n--------------------------------------------------------------------------------------------\nPrinting Logs: This might take a while depending upon the size\n---------------------------------------------------------------------------------------------';

  /// Print Data Logs Messages
  static const PRINT_DATA_LOG_MSG =
      // ignore: lines_longer_than_80_chars
      '\n--------------------------------------------------------------------------------------------\nPrinting Data Logs: This might take a while depending upon the size\n----------------------------------------------------------------------------------------';
}
