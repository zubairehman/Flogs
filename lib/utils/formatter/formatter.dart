import 'package:f_logs/f_logs.dart';
import 'package:flutter/foundation.dart';

class Formatter {
  static String format(Log log, LogsConfig config) {
    String output;

    if (config.formatType.toString() == FormatType.FORMAT_CURLY.toString()) {
      output = _formatCurly(
          log, config.isDevelopmentDebuggingEnabled, config.printEmpty);
    } else if (config.formatType.toString() ==
        FormatType.FORMAT_SQUARE.toString()) {
      output = _formatSquare(
          log, config.isDevelopmentDebuggingEnabled, config.printEmpty);
    } else if (config.formatType.toString() ==
        FormatType.FORMAT_CSV.toString()) {
      output = _formatCsv(log, config.csvDelimiter,
          config.isDevelopmentDebuggingEnabled, config.printEmpty);
    } else if (config.formatType.toString() ==
        FormatType.FORMAT_CUSTOM.toString()) {
      output = _formatCustom(
          log,
          config.customOpeningDivider,
          config.customClosingDivider,
          config.isDevelopmentDebuggingEnabled,
          config.fieldOrderFormatCustom,
          config.printEmpty);
    } else {
      output = _formatCurly(
          log, config.isDevelopmentDebuggingEnabled, config.printEmpty);
    }

    return output + "\n";
  }

  static String _formatCurly(
      Log log, bool isDevelopmentDebuggingEnabled, bool printEmpty) {
    String output;

    if (log != null) {
      output = "{${log.className}} ";
      output += "{${log.methodName}} ";
      output += "{${log.text}} ";
      output += log.exception != 'null'
          ? "{${log.exception}} "
          : printEmpty ? "{} " : "";
      output += "{${log.logLevel.toString()}} ";
      output += "{${log.timestamp}} ";
      output += log.stacktrace != 'null'
          ? "{${log.stacktrace}} "
          : printEmpty ? "{} " : "";

      if (isDevelopmentDebuggingEnabled) {
        output +=
            !kReleaseMode ? "{${log.dataLogType}} " : printEmpty ? "{} " : "";
        output +=
            !kReleaseMode ? "{${log.timeInMillis}}" : printEmpty ? "{} " : "";
      }
    }

    return output;
  }

  static String _formatSquare(
      Log log, bool isDevelopmentDebuggingEnabled, bool printEmpty) {
    String output;

    if (log != null) {
      output = "[${log.className}] ";
      output += "[${log.methodName}] ";
      output += "[${log.text}] ";
      output += log.exception != 'null'
          ? "[${log.exception}] "
          : printEmpty ? "[] " : "";
      output += "[${log.logLevel.toString()}] ";
      output += "[${log.timestamp}] ";
      output += log.stacktrace != 'null'
          ? "[${log.stacktrace}] "
          : printEmpty ? "[] " : "";

      if (isDevelopmentDebuggingEnabled) {
        output +=
            !kReleaseMode ? "[${log.dataLogType}] " : printEmpty ? "[] " : "";
        output +=
            !kReleaseMode ? "[${log.timeInMillis}]" : printEmpty ? "[] " : "";
      }
    }

    return output;
  }

  static String _formatCsv(Log log, String deliminator,
      bool isDevelopmentDebuggingEnabled, bool printEmpty) {
    String output;

    if (log != null) {
      output = "${log.className}$deliminator ";
      output += "${log.methodName}$deliminator ";
      output += "${log.text}$deliminator ";
      output += log.exception != 'null'
          ? "${log.exception}$deliminator "
          : printEmpty ? "$deliminator " : "";
      output += "${log.logLevel.toString()}$deliminator ";
      output += "${log.timestamp} ";
      output += log.stacktrace != 'null'
          ? "${log.stacktrace}$deliminator "
          : printEmpty ? "$deliminator " : "";

      if (isDevelopmentDebuggingEnabled) {
        output += !kReleaseMode
            ? "${log.dataLogType} "
            : printEmpty ? "$deliminator " : "";
        output += !kReleaseMode
            ? "${log.timeInMillis}"
            : printEmpty ? "$deliminator " : "";
      }
    }

    return output;
  }

  static String _formatCustom(
      Log log,
      String openingDivider,
      String closingDivider,
      bool isDevelopmentDebuggingEnabled,
      List<FieldName> fieldOrder,
      bool printEmpty) {
    String output = "";

    if (log != null && fieldOrder.isNotEmpty) {
      fieldOrder.forEach((fieldName) {
        if (fieldName == FieldName.CLASSNAME) {
          output += "$openingDivider${log.className}$closingDivider ";
        }
        if (fieldName == FieldName.METHOD_NAME) {
          output += "$openingDivider${log.methodName}$closingDivider ";
        }
        if (fieldName == FieldName.TEXT) {
          output += "$openingDivider${log.text}$closingDivider ";
        }
        if (fieldName == FieldName.EXCEPTION) {
          output += log.exception != 'null'
              ? "$openingDivider${log.exception}$closingDivider "
              : printEmpty ? "$openingDivider$closingDivider " : "";
        }
        if (fieldName == FieldName.LOG_LEVEL) {
          output += "$openingDivider${log.logLevel.toString()}$closingDivider ";
        }
        if (fieldName == FieldName.TIMESTAMP) {
          output += "$openingDivider${log.timestamp}$closingDivider ";
        }
        if (fieldName == FieldName.STACKTRACE) {
          output += log.stacktrace != 'null'
              ? "$openingDivider${log.stacktrace}$closingDivider "
              : printEmpty ? "$openingDivider$closingDivider " : "";
        }
      });

      if (isDevelopmentDebuggingEnabled) {
        output += !kReleaseMode
            ? "$openingDivider${log.dataLogType}$closingDivider "
            : printEmpty ? "$openingDivider$closingDivider " : "";
        output += !kReleaseMode
            ? "$openingDivider${log.timeInMillis}$closingDivider"
            : printEmpty ? "$openingDivider$closingDivider " : "";
      }
    }

    return output;
  }
}
