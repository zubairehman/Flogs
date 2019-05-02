enum FormatType { FORMAT_CURLY, FORMAT_SQUARE, FORMAT_CSV, FORMAT_CUSTOM }

class FormatTypeConverter {
  static String fromEnumToString(FormatType type) {
    return type.toString();
  }

  static FormatType fromStringToEnum(String type) {
    return FormatType.values.firstWhere((e) => e.toString() == type);
  }
}
