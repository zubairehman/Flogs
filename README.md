# FLogs Advance Logging Framework

FLog is an Advanced Logging Framework develop in flutter that provides quick & simple logging solution. All logs are saved to the DB which can then be exported as a zip file.

Overview
--------

All logs are saved to files in storage path provided. These logs are helpful when developer wants to analyze user activities within the app. A new log file is created every hour on a user event. These logs can be filtered and sorted easily. Logs can easily be exported as zip file base on filter type. This zip file can be uploaded to server on export. FLogs also provide functionality to log arrange data logs into a predefined directory structure. These logs can be used for a specific event within the app.

![banner](https://github.com/zubairehman/Flogs/blob/master/images/flogs-banner.png)


Features
--------

1. Logs events in files created separately every hour with **'FLogs'** logger. (24 hours)
2. Files can be compressed and exported for time and day filters
3. Clear Logs easily
4. Save logs to custom path (Supported in Android only)
5. Export Logs to custom path as zip file (Supported in Android only)
6. Custom Log formatting
7. CSV support
8. Custom timestamps support
9. Custom data logging support with **'DataLogs'** logger.
10. Encryption support added
11. Multiple directory structures
12. Print logs as String
13. Export all or single types of logs
14. Advanced Automation for deleting logs automatically
15. Exports HTML formatted exceptions

                
Use this package as a library
-----------------------------

**1. Depend on it**

Add this to your package's pubspec.yaml file:

```
dependencies:
  f_logs: ^0.0.2
```

**2. Install it**

You can install packages from the command line:

with Flutter

```
$ flutter packages get
```

Alternatively, your editor might support flutter packages get. Check the docs for your editor to learn more.

**3. Import it**

Now in your Dart code, you can use:

```
import 'package:f_logs/constants/constants.dart';
import 'package:f_logs/constants/db_constants.dart';
import 'package:f_logs/data/local/app_database.dart';
import 'package:f_logs/data/local/flog_dao.dart';
import 'package:f_logs/model/datalog/data_log_type.dart';
import 'package:f_logs/model/flog/flog.dart';
import 'package:f_logs/model/flog/flog_config.dart';
import 'package:f_logs/model/flog/log.dart';
import 'package:f_logs/model/flog/log_level.dart';
import 'package:f_logs/utils/filters/filters.dart';
import 'package:f_logs/utils/formatter/formate_type.dart';
import 'package:f_logs/utils/formatter/formatter.dart';
import 'package:f_logs/utils/storage/logs_storage.dart';
import 'package:f_logs/utils/timestamp/timestamp_format.dart';
```

How to use
------------

**1. Simple Info Log**

```dart
    FLog.logThis(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log",
      type: LogLevel.INFO);
```

**2. Simple Warning Log**

```dart
    FLog.logThis(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log",
      type: LogLevel.WARNING);
```

**3. Error Log**

```dart
    FLog.logThis(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log",
      type: LogLevel.ERROR);
```

**4. Severe Log**

```dart
    FLog.logThis(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log",
      type: LogLevel.SEVERE);
```

**5. Exception Log**

```dart
    FLog.logThis(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log",
      type: LogLevel.SEVERE, 
      exception: Exception("This is an Exception!"));
```

**6. Data Log**

```dart
    FLog.logThis(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log",
      type: LogLevel.SEVERE,
      dataLogType: DataLogType.DEVICE.toString());
```

Wiki
--------

Will be available soon

