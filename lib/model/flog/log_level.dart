enum LogLevel { ALL, TRACE, DEBUG, INFO, WARNING, ERROR, SEVERE, FATAL, OFF }

class LogLevelConverter {
  static String fromEnumToString(LogLevel type) {
    return type.toString();
  }

  static LogLevel fromStringToEnum(String type) {
    return LogLevel.values.firstWhere((e) => e.toString() == type);
  }
}
