enum LogLevel { INFO, WARNING, ERROR, SEVERE }

class LogLevelConverter {
  static String fromEnumToString(LogLevel type) {
    return type.toString();
  }

  static LogLevel fromStringToEnum(String type) {
    return LogLevel.values.firstWhere((e) => e.toString() == type);
  }
}
