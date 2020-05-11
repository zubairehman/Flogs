class Constants {
  Constants._();

  /// Directory
  static const DIRECTORY_NAME = 'FLogs';

  /// Missing Initialization Exception
  static const EXCEPTION_NOT_INIT =
      'FLog is not initialized! Please provide FLog configuration by calling FLog.applyConfigurations(LogsConfig config) in your application class';

  /// Encryption key null exception
  static const EXCEPTION_NULL_KEY =
      'Encryption key is not provided, please provide encryption key in LogsConfig';

  /// Null Logs Level Exception
  static const EXCEPTION_NULL_LOGS_LEVEL =
      'ActiveLogLevel is not provided or null, please provide activeLogLevel key in LogsConfig';

  /// Print Export Messages
  static const EXCEPTION_NULL_LOGS_LEVEL =
      'ActiveLogLevel is not provided or null, please provide activeLogLevel key in LogsConfig';

  // Print Messages
  static const PRINT_EXPORT_MSG =
      '\n--------------------------------------------------------------------------------------------\nExporting Logs: This might take a while depending upon the size\n--------------------------------------------------------------------------------------------';
  /// Print Log Messages
  static const PRINT_LOG_MSG =
      '\n--------------------------------------------------------------------------------------------\nPrinting Logs: This might take a while depending upon the size\n--------------------------------------------------------------------------------------------';
  /// Print Data Logs Messages
  static const PRINT_DATA_LOG_MSG =
      '\n--------------------------------------------------------------------------------------------\nPrinting Data Logs: This might take a while depending upon the size\n--------------------------------------------------------------------------------------------';
}
