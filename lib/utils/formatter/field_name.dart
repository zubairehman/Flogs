enum FieldName {
  CLASSNAME,
  METHOD_NAME,
  TEXT,
  EXCEPTION,
  LOG_LEVEL,
  TIMESTAMP,
  STACKTRACE
}

/// Simple class which provide methods to convert `FieldName` to String and back
class FieldNameConverter {
  /// Converts `FieldName` to String
  static String fromEnumToString(FieldName field) {
    return field.toString();
  }

  /// String to `FieldName`
  static FieldName fromStringToEnum(String field) {
    return FieldName.values.firstWhere((e) => e.toString() == field);
  }
}
