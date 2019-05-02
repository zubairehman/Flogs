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
    PLog.logThis(TAG, "method_name", "Log: " + Math.random(), LogLevel.INFO);
```

**2. Simple Warning Log**

```dart
    PLog.logThis(TAG, "method_name", "This is a warning message!", LogLevel.WARNING);
```

**3. Error Log**

```dart
    PLog.logThis(TAG, "method_name", "This is a error message!", LogLevel.ERROR);
```

**4. Severe Log**

```dart
    PLog.logThis(TAG, "method_name", "This is a severe error message!", LogLevel.SEVERE);
```

**5. Exception Log**

```dart
    PLog.logThis(TAG, "method_name", "This is a error message!", LogLevel.ERROR, exception: Exception("This is an Exception!"));
    PLog.logThis(TAG, "reportError", Exception("This is an Exception!"));
```

Wiki
--------

Will be available soon

Kotlin Version
--------

Checkout the kotlin version: [Kotlin Version](https://github.com/umair13adil/RxLogs)


## MIT License

##### Copyright (c) 2019 Zubair Rehman Dar

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
