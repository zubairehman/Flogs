import 'package:f_logs/model/flog/flog_config.dart';
import 'package:f_logs/model/flog/log.dart';
import 'package:f_logs/utils/formatter/formate_type.dart';
import 'package:flutter/foundation.dart';

class Formatter {
  static String format(Log log, LogsConfig config) {
    String output;

    if (config.formatType.toString() == FormatType.FORMAT_CURLY.toString()) {
      output = _formatCurly(log, config.isDevelopmentDebuggingEnabled);
    } else if (config.formatType.toString() ==
        FormatType.FORMAT_SQUARE.toString()) {
      output = _formatSquare(log, config.isDevelopmentDebuggingEnabled);
    } else if (config.formatType.toString() ==
        FormatType.FORMAT_CSV.toString()) {
      output = _formatCsv(
          log, config.csvDelimiter, config.isDevelopmentDebuggingEnabled);
    } else if (config.formatType.toString() ==
        FormatType.FORMAT_CUSTOM.toString()) {
      output = _formatCustom(log, config.customOpeningDivider,
          config.customClosingDivider, config.isDevelopmentDebuggingEnabled);
    } else {
      output = _formatCurly(log, config.isDevelopmentDebuggingEnabled);
    }

    return output + "\n";
  }

  static String _formatCurly(Log log, bool isDevelopmentDebuggingEnabled) {
    String output;

    if (log != null) {
      output = "{${log.className}} ";
      output += "{${log.methodName}} ";
      output += "{${log.text}} ";
      output += log.exception != 'null' ? "{${log.exception}} " : "";
      output += "{${log.logLevel.toString()}} ";
      output += "{${log.timestamp}}";

      if (isDevelopmentDebuggingEnabled) {
        output += !kReleaseMode ? " {${log.dataLogType}}" : "";
        output += !kReleaseMode ? " {${log.timeInMillis}}" : "";
      }
    }

    return output;
  }

  static String _formatSquare(Log log, bool isDevelopmentDebuggingEnabled) {
    String output;

    if (log != null) {
      output = "[${log.className}] ";
      output += "[${log.methodName}] ";
      output += "[${log.text}] ";
      output += log.exception != 'null' ? "[${log.exception}] " : "";
      output += "[${log.logLevel.toString()}] ";
      output += "[${log.timestamp}]";

      if (isDevelopmentDebuggingEnabled) {
        output += !kReleaseMode ? " [${log.dataLogType}]" : "";
        output += !kReleaseMode ? " [${log.timeInMillis}]" : "";
      }
    }

    return output;
  }

  static String _formatCsv(
      Log log, String deliminator, bool isDevelopmentDebuggingEnabled) {
    String output;

    if (log != null) {
      output = "${log.className}$deliminator ";
      output += "${log.methodName}$deliminator ";
      output += "${log.text}$deliminator ";
      output += log.exception != 'null' ? "${log.exception}$deliminator " : "";
      output += "${log.logLevel.toString()}$deliminator ";
      output += "${log.timestamp}";

      if (isDevelopmentDebuggingEnabled) {
        output += !kReleaseMode ? " ${log.dataLogType}" : "";
        output += !kReleaseMode ? " ${log.timeInMillis}" : "";
      }
    }

    return output;
  }

  static String _formatCustom(Log log, String openingDivider,
      String closingDivider, bool isDevelopmentDebuggingEnabled) {
    String output;

    if (log != null) {
      output = "$openingDivider${log.className}$closingDivider ";
      output += "$openingDivider${log.methodName}$closingDivider ";
      output += "$openingDivider${log.text}$closingDivider ";
      output += log.exception != 'null'
          ? "$openingDivider${log.exception}$closingDivider "
          : "";
      output += "$openingDivider${log.logLevel.toString()}$closingDivider ";
      output += "$openingDivider${log.timestamp}$closingDivider";

      if (isDevelopmentDebuggingEnabled) {
        output += !kReleaseMode
            ? " $openingDivider${log.dataLogType}$closingDivider"
            : "";
        output += !kReleaseMode
            ? " $openingDivider${log.timeInMillis}$closingDivider"
            : "";
      }
    }

    return output;
  }
}
