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
16. Log level support
                
Use this package as a library
-----------------------------

**1. Depend on it**

Add this to your package's pubspec.yaml file:

```
dependencies:
  f_logs: ^1.0.x
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
import 'package:f_logs/f_logs.dart';
```

How to use
----------

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

**1. Simple Trace Log**

```dart 
    FLog.trace(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log");
```

**2. Simple Debug Log**

```dart 
    FLog.debug(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log");
```

**3. Simple Info Log**

```dart 
    FLog.info(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log");
```

**4. Simple Warning Log**

```dart 
    FLog.warning(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log";
```

**5. Simple Error Log**

```dart 
    FLog.error(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log");
```

**6. Simple Severe Log**

```dart 
    FLog.severe(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log");
```

**7. Severe Log with Exception and StackTrace**

```dart 
    FLog.logThis(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log",
      type: LogLevel.SEVERE, 
      exception: Exception("This is an Exception!"),
      stacktrace: StackTrace.current);
```

**8. Simple Fatal Log**

```dart 
    FLog.fatal(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log");
```

**9. Data Type Log**

```dart 
    FLog.logThis(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "My log",
      type: LogLevel.SEVERE,
      dataLogType: DataLogType.DEVICE.toString());
```

Available Methods
-----------------
FLogs provide many convenience methods to save logs into or to fetch them from database, below is the list of all the methods available:

**1. logThis**

Logs string data along with className, methodName, logText and the type of log (LogLevel.SEVERE, LogLevel.INFO) etc. The same method can be used to log exception(s) or data logs. The difference between FLog and DataLogs is described above, you can also check out wiki for more details. If either className or methodName is not provided, it will automatically be taken by getting calling class and method.

```dart 
static logThis({
    String className, // This is optional if not provided, then it will automatically be taken by getting calling class
    String methodName, // This is optional if not provided, then it will automatically be taken by getting calling method
    @required String text,
    @required LogLevel type,
    Exception exception,
    String dataLogType,
    StackTrace stacktrace,
}){}
```

**2. trace**

Logs string data along with className, methodName, logText and the type of log (LogLevel.SEVERE, LogLevel.INFO) etc. The same method can be used to log exception(s) or data logs. If either className or methodName is not provided, it will automatically be taken by getting calling class and method.

```dart 
static trace({
    String className, // This is optional if not provided, then it will automatically be taken by getting calling class
    String methodName, // This is optional if not provided, then it will automatically be taken by getting calling method
    @required String text,
    Exception exception,
    String dataLogType,
    StackTrace stacktrace,
}){}
```

**3. debug**

Logs string data along with className, methodName, logText and the type of log (LogLevel.SEVERE, LogLevel.INFO) etc. The same method can be used to log exception(s) or data logs. If either className or methodName is not provided, it will automatically be taken by getting calling class and method.

```dart 
static debug({
    String className, // This is optional if not provided, then it will automatically be taken by getting calling class
    String methodName, // This is optional if not provided, then it will automatically be taken by getting calling method
    @required String text,
    Exception exception,
    String dataLogType,
    StackTrace stacktrace,
}){}
```

**4. info**

Logs string data along with className, methodName, logText and the type of log (LogLevel.SEVERE, LogLevel.INFO) etc. The same method can be used to log exception(s) or data logs. If either className or methodName is not provided, it will automatically be taken by getting calling class and method.

```dart 
static info({
    String className, // This is optional if not provided, then it will automatically be taken by getting calling class
    String methodName, // This is optional if not provided, then it will automatically be taken by getting calling method
    @required String text,
    Exception exception,
    String dataLogType,
    StackTrace stacktrace,
}){}
```

**5. warning**

Logs string data along with className, methodName, logText and the type of log (LogLevel.SEVERE, LogLevel.INFO) etc. The same method can be used to log exception(s) or data logs. If either className or methodName is not provided, it will automatically be taken by getting calling class and method.

```dart 
static warning({
    String className, // This is optional if not provided, then it will automatically be taken by getting calling class
    String methodName, // This is optional if not provided, then it will automatically be taken by getting calling method
    @required String text,
    Exception exception,
    String dataLogType,
    StackTrace stacktrace,
}){}

```

**6. error**

Logs string data along with className, methodName, logText and the type of log (LogLevel.SEVERE, LogLevel.INFO) etc. The same method can be used to log exception(s) or data logs. If either className or methodName is not provided, it will automatically be taken by getting calling class and method.

```dart 
static error({
    String className, // This is optional if not provided, then it will automatically be taken by getting calling class
    String methodName, // This is optional if not provided, then it will automatically be taken by getting calling method
    @required String text,
    Exception exception,
    String dataLogType,
    StackTrace stacktrace,
}){}

```

**7. severe**

Logs string data along with className, methodName, logText and the type of log (LogLevel.SEVERE, LogLevel.INFO) etc. The same method can be used to log exception(s) or data logs. If either className or methodName is not provided, it will automatically be taken by getting calling class and method.

```dart 
static severe({
    String className, // This is optional if not provided, then it will automatically be taken by getting calling class
    String methodName, // This is optional if not provided, then it will automatically be taken by getting calling method
    @required String text,
    Exception exception,
    String dataLogType,
    StackTrace stacktrace,
}){}

```

**8. fatal**

Logs string data along with className, methodName, logText and the type of log (LogLevel.SEVERE, LogLevel.INFO) etc. The same method can be used to log exception(s) or data logs. If either className or methodName is not provided, it will automatically be taken by getting calling class and method.

```dart 
static fatal({
    String className, // This is optional if not provided, then it will automatically be taken by getting calling class
    String methodName, // This is optional if not provided, then it will automatically be taken by getting calling method
    @required String text,
    Exception exception,
    String dataLogType,
    StackTrace stacktrace,
}){}

```

**9. printLogs**

Fetches all the logs from database and prints them as a string using StringBuffer()

```dart 
static printLogs() async {}
```

**10. getAllLogsByCustomFilter**

Accepts list of filters as an arguments and returns list of logs based on the provided filters. The use of Filters with their usage is explained in wiki, please checkout wiki for more details.

```dart 
List<Filter> filters = [Filter.greaterThan('[FieldName]', '[Value]')]

static Future<List<Log>> getAllLogsByCustomFilter(
    {List<Filter> filters}) async {}
```

**11. getAllLogsByFilter**

A convenience method that filters data based on the provided filter params e.g. dataLogsType (DataLogType.DEVICE,  DataLogType.NETWORK), logLevels(LogLevel.SEVERE, LogLevel.INFO), startTimeInMillis (millisec of the day you from where you want logs to be fetched), endTimeInMillis (milisec of the day you till you want logs to be fetched) and filterType (FilterType.LAST_HOUR, FilterType.LAST_24_HOURS, FilterType.TODAY, FilterType.WEEK, FilterType.ALL). Filter type can't be used with `startTimeInMillis`, `endTimeInMillis`, if so the priority will be given to `startTimeInMillis`, `endTimeInMillis`. In-order to have full control over filters, use method provided above.

```dart 
static Future<List<Log>> getAllLogsByFilter(
    {List<String> dataLogsType,
    List<String> logLevels,
    int startTimeInMillis,
    int endTimeInMillis,
    FilterType filterType}}) async {}
```

**12. getAllLogs**

Fetches all the logs from database and returns a list of logs.

```dart 
static Future<List<Log>> getAllLogs() async {}
```

**13. exportLogs**

Exports logs to external storage under FLog directory.

```dart 
static exportLogs() async {}
```

**14. clearLogs**

Clears all the logs stored in database.

```dart 
static clearLogs() {}
```

**15. applyConfigurations**

Apply user provided configurations to FLogs.

```dart 
static applyConfigurations(LogsConfig config) {}
```

**16. deleteAllLogsByFilter**

Accepts list of filters as an arguments and delete logs based on the provided filters. The use of Filters with their usage is explained in wiki, please checkout wiki for more details.

```dart 
List<Filter> filters = [Filter.greaterThan('[FieldName]', '[Value]')]

static deleteAllLogsByFilter(
    {List<Filter> filters}) async {}
```

Wiki
----

Checkout [wiki](https://github.com/zubairehman/Flogs/wiki) for more info

