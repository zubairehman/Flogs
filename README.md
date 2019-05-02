# FLogs Advance Logging Framework

FLog is an Advanced Logging Framework develop in flutter that provides quick & simple logging solution. All logs are saved to the DB which can then be exported as a zip file.

Overview
--------

All logs are saved to files in storage path provided. These logs are helpful when developer wants to analyze user activities within the app. A new log file is created every hour on a user event. These logs can be filtered and sorted easily. Logs can easily be exported as zip file base on filter type. This zip file can be uploaded to server on export. FLogs also provide functionality to log arrange data logs into a predefined directory structure. These logs can be used for a specific event within the app.


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

                
#### To Log data to file simply call like this
_______________________________________________

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

