enum DataLogType {
  DEFAULT,
  DEVICE,
  LOCATION,
  NOTIFICATION,
  NETWORK,
  DATABASE,
  ERRORS
}

class DataLogTypeConverter {
  static String fromEnumToString(DataLogType type) {
    return type.toString();
  }

  static DataLogType fromStringToEnum(String type) {
    return DataLogType.values.firstWhere((e) => e.toString() == type);
  }
}
