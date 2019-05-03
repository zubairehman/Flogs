![banner](https://github.com/zubairehman/Flogs/blob/master/images/flogs-banner.png)

# FLogs Advance Logging Framework

FLog is an Advanced Logging Framework develop in flutter that provides quick & simple logging solution. All logs are saved to the DB which can then be exported as a zip file.

Overview
--------

FLogs is written in dart. It basically features two types of loggers (FLog & DataLog) with many of advanced features needed for logging. Logs are saved in database which can then be exported in document directory of Android|iOS device. The logs are helpful when developer wants to analyze user activities within the app. These logs can be filtered and sorted easily. Logs can easily be exported as zip file base on filter type, the zip file can then be uploaded to server or to use it locally. 

Many times we want to log set of data to analyze certain activity e.g. Location (GPS Coordinates), Device info, Network requests etc. this helps us to quickly identify and fix the issue that is hard to debug when the app is in production. FLogs provide such functionality to log data set into database. These logs can then be fetched by applying different convinience filters availale.

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
Log files are exported on storage directory so it's very important to add these permissions to your project's manifest file first.

**Android**
```
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```
**iOS**
```
<key>NSPhotoLibraryAddUsageDescription</key>
<string>FLogs would like to save photos from the app to your gallery</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>FLogs would like to access your photo gallery for uploading images to the app</string>
```

To save logs, simply call any of the method mentioned below:

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

Checkout [wiki](https://github.com/zubairehman/Flogs/wiki) for more info

