import 'package:example/ui/home_page.dart';
import 'package:f_logs/model/datalog/data_log_type.dart';
import 'package:f_logs/model/flog/flog.dart';
import 'package:f_logs/model/flog/flog_config.dart';
import 'package:f_logs/model/flog/log_level.dart';
import 'package:f_logs/utils/formatter/formate_type.dart';
import 'package:f_logs/utils/timestamp/timestamp_format.dart';
import 'package:flutter/material.dart';

void main() {
  init();
  runApp(HomePage());
}

init() {
  LogsConfig config = LogsConfig()
    ..isDebuggable = true
    ..customClosingDivider = "|"
    ..customOpeningDivider = "|"
    ..csvDelimiter = ", "
    ..isLogEnabled = true
    ..encryptionEnabled = false
    ..encryptionKey = ""
    ..formatType = FormatType.FORMAT_CURLY
    ..logLevelsEnabled = [LogLevel.INFO, LogLevel.ERROR]
    ..dataLogTypes = [DataLogType.DEVICE.toString(), DataLogType.NETWORK.toString(), "Zubair"]
    ..timestampFormat = TimestampFormat.TIME_FORMAT_READABLE;

  FLog.applyConfigurations(config);
}
