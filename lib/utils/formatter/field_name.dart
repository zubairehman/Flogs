enum FieldName {
  CLASSNAME,
  METHOD_NAME,
  TEXT,
  EXCEPTION,
  LOG_LEVEL,
  TIMESTAMP,
  STACKTRACE
}

class FieldNameConverter {
  static String fromEnumToString(FieldName field) {
    return field.toString();
  }

  static FieldName fromStringToEnum(String field) {
    return FieldName.values.firstWhere((e) => e.toString() == field);
  }
}
