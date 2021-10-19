enum LogLevel { ALL, TRACE, DEBUG, INFO, WARNING, ERROR, SEVERE, FATAL, OFF }

/// Simple class which provide methods to convert `LogLevel` to String and back
class LogLevelConverter {
  /// Converts `LogLevel` to String
  static String fromEnumToString(LogLevel? type) {
    return type.toString();
  }

  /// String to `LogLevel`
  static LogLevel fromStringToEnum(String? type) {
    return LogLevel.values.firstWhere((e) => e.toString() == type);
  }
}
