enum FormatType { FORMAT_CURLY, FORMAT_SQUARE, FORMAT_CSV, FORMAT_CUSTOM }

/// Simple class which provide methods to convert `FormatType` to String and back
class FormatTypeConverter {
  /// Converts `FormatType` to String
  static String fromEnumToString(FormatType type) {
    return type.toString();
  }

  /// String to `FormatType`
  static FormatType fromStringToEnum(String type) {
    return FormatType.values.firstWhere((e) => e.toString() == type);
  }
}
