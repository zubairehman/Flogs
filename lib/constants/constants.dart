class Constants {
  Constants._();

  // Directory
  static const DIRECTORY_NAME = 'FLogs';

  // FLog Exceptions
  static const EXCEPTION_NOT_INIT =
      'FLog is not initialized! Please provide FLog configuration by calling FLog.applyConfigurations(LogsConfig config) in your application class';

  static const EXCEPTION_NULL_KEY =
      'Encryption key is not provided, please provide encryption key in LogsConfig';

  // Print Messages
  static const PRINT_EXPORT_MSG =
      '\n--------------------------------------------------------------------------------------------\nExporting Logs: This might take a while depending upon the size\n--------------------------------------------------------------------------------------------';
  static const PRINT_LOG_MSG =
      '\n--------------------------------------------------------------------------------------------\nPrinting Logs: This might take a while depending upon the size\n--------------------------------------------------------------------------------------------';
  static const PRINT_DATA_LOG_MSG =
      '\n--------------------------------------------------------------------------------------------\nPrinting Data Logs: This might take a while depending upon the size\n--------------------------------------------------------------------------------------------';
}
