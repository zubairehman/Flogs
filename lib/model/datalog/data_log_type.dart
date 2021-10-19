enum DataLogType {
  DEFAULT,
  DEVICE,
  LOCATION,
  NOTIFICATION,
  NETWORK,
  DATABASE,
  ERRORS
}

/// Simple class which provide methods to convert `DataLogType` to String and back
class DataLogTypeConverter {
  /// Converts `DataLogType` to String
  static String fromEnumToString(DataLogType type) {
    return type.toString();
  }

  /// String to `DataLogType`
  static DataLogType fromStringToEnum(String type) {
    return DataLogType.values.firstWhere((e) => e.toString() == type);
  }
}
