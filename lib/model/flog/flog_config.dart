import 'package:f_logs/model/datalog/data_log_type.dart';
import 'package:f_logs/model/flog/log_level.dart';
import 'package:f_logs/utils/formatter/formate_type.dart';
import 'package:f_logs/utils/timestamp/timestamp_format.dart';

class LogsConfig {

  var isDebuggable = true; //print logs in Logcat
  var isDevelopmentDebuggingEnabled = false; //print logs in Logcat
  var isLogEnabled = true; //Logs are enabled
  var logLevelsEnabled = List<LogLevel>(); //Levels like Info, Warning, Error, Severe
  var dataLogTypes = [DataLogType.DEFAULT.toString()]; //Like Network, Database, Location etc
  var formatType = FormatType.FORMAT_CURLY; //Default format of '{String}' log data
  var customOpeningDivider = " "; //For log field open
  var customClosingDivider = " "; //For log field close
  var csvDelimiter = ""; //Delimiter for CSV files
  var encryptionEnabled = false; //Encryption enabled
  var encryptionKey = ""; //Encryption Key
  var timestampFormat = TimestampFormat.TIME_FORMAT_READABLE; //Timestamp format
}