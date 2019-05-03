import 'package:f_logs/model/flog/flog_config.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {

  DateTimeUtils._();

  //DateTime Methods:-----------------------------------------------------------
  static int getCurrentTimeInMillis() {
    final now = DateTime.now();
    return now.millisecondsSinceEpoch;
  }

  static String getTimeInMillis(LogsConfig config) {
    final now = DateTime.now();
    var fiftyDaysFromNow = now.add(new Duration(days: -1));
    return DateFormat(config.timestampFormat.toString()).format(fiftyDaysFromNow);
  }

  static String getCurrentTimestamp(LogsConfig config) {
    final now = DateTime.now();
    return DateFormat(config.timestampFormat.toString()).format(now);
  }

}