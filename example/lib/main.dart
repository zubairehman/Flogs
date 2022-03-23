import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sembast/sembast.dart';

void main() {
  init();
  runApp(HomePage());
}

init() {
  /// Configuration example 1
//  LogsConfig config = LogsConfig()
//    ..isDebuggable = true
//    ..isDevelopmentDebuggingEnabled = true
//    ..customClosingDivider = "|"
//    ..customOpeningDivider = "|"
//    ..csvDelimiter = ", "
//    ..isLogsEnabled = true
//    ..encryptionEnabled = false
//    ..encryptionKey = "123"
//    ..formatType = FormatType.FORMAT_CURLY
//    ..logLevelsEnabled = [LogLevel.INFO, LogLevel.ERROR]
//    ..dataLogTypes = [
//      DataLogType.DEVICE.toString(),
//      DataLogType.NETWORK.toString(),
//      "Zubair"
//    ]
//    ..stackTraceFormatter = CustomFormatter.formatStackTrace
//    ..timestampFormat = TimestampFormat.TIME_FORMAT_FULL_1;

  /// Configuration example 2
//  LogsConfig config = FLog.getDefaultConfigurations()
//    ..isDevelopmentDebuggingEnabled = true
//    ..timestampFormat = TimestampFormat.TIME_FORMAT_FULL_2;

  /// Configuration example 3 Format Custom
  LogsConfig config = FLog.getDefaultConfigurations()
    ..isDevelopmentDebuggingEnabled = true
    ..timestampFormat = TimestampFormat.TIME_FORMAT_FULL_3
    ..formatType = FormatType.FORMAT_CUSTOM
    ..fieldOrderFormatCustom = [
      FieldName.TIMESTAMP,
      FieldName.LOG_LEVEL,
      FieldName.CLASSNAME,
      FieldName.METHOD_NAME,
      FieldName.TEXT,
      FieldName.EXCEPTION,
      FieldName.STACKTRACE
    ]
    ..customOpeningDivider = "{"
    ..customClosingDivider = "}";

  FLog.applyConfigurations(config);
}

class CustomFormatter {
  static String formatStackTrace(StackTrace stackTrace) {
    // You can handle the stackTrace here and return your own custom string as stack trace
    // As an example, the default stack trace is returned
    return stackTrace.toString();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //runtime permission
  final Permission _permissionGroup = Permission.storage;

  @override
  void initState() {
    super.initState();
    requestPermission(_permissionGroup);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTextField(),
              _buildRow1(context),
              _buildRow2(),
              _buildRow3(),
              _buildRow4(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextField() {
    return CircularProgressIndicator();
//    return TextFormField(
//      decoration: InputDecoration(hintText: "Enter text"),
//    );
  }

  _buildRow1(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildButton("Log Event", () {
          logInfo();
          logException();
          logError();
          logWarning();
          logTrace();
        }),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        _buildButton("Print Logs", () {
          FLog.printLogs();
        }),
      ],
    );
  }

  _buildRow2() {
    return Row(
      children: <Widget>[
        _buildButton("Export Logs", () {
          FLog.exportLogs();
        }),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        _buildButton("Clear Logs", () {
          FLog.clearLogs();
        }),
      ],
    );
  }

  _buildRow3() {
    return Row(
      children: <Widget>[
        _buildButton("Print File Logs", () {
          FLog.printFileLogs();
        }),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        _buildButton("Print Data Logs", () {
          FLog.printDataLogs(dataLogsType: [
            DataLogType.DEVICE.toString(),
            "Zubair",
            "Jawad"
          ], logLevels: [
            LogLevel.ERROR.toString(),
            LogLevel.WARNING.toString()
          ], filterType: FilterType.WEEK
//            startTimeInMillis: 1556132400000,
//            endTimeInMillis: 1556650800000,
              );
        }),
      ],
    );
  }

  _buildRow4() {
    return Row(
      children: <Widget>[
        _buildButton("Log Event with StackTrace", () {
          FLog.error(
            text: "My log",
            dataLogType: "Zubair",
            className: "Home",
            exception: Exception("Exception and StackTrace"),
            stacktrace: StackTrace.current,
          );
        }),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        _buildButton("Delete Logs by Filter (older then 10 seconds)", () {
          FLog.deleteAllLogsByFilter(filters: [
            Filter.lessThan(DBConstants.FIELD_TIME_IN_MILLIS,
                DateTime.now().millisecondsSinceEpoch - 1000 * 10)
          ]);
        }),
      ],
    );
  }

  _buildButton(String title, VoidCallback onPressed) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(title),
        textColor: Colors.white,
        color: Colors.blueAccent,
      ),
    );
  }

  // general methods:-----------------------------------------------------------
  void logInfo() {
//    FLog.logThis(
//      className: "HomePage",
//      methodName: "_buildRow1",
//      text: "Log text/descritption goes here",
//      type: LogLevel.INFO,
//      dataLogType: DataLogType.DEVICE.toString(),
//    );

//    final LogLevel _newLogLevel = null;
//    FLog.getDefaultConfigurations()..activeLogLevel = _newLogLevel;
    FLog.info(
        text:
            'LogLevel set to: ${FLog.getDefaultConfigurations().activeLogLevel}.');
  }

  void logException() {
    try {
      var result = 9 ~/ 0;
      print(result);
    } on Exception catch (exception) {
      FLog.error(
        text: "Exception text/descritption goes here",
        dataLogType: "Exception (the type could be anything)",
        className: "Home",
        exception: exception,
      );
    }
  }

  void logError() {
    try {
      var string = "Zubair";
      var index = string[-1];
      debugPrint(index.toString());
    } on Error catch (error) {
      FLog.error(
        text: "Error text/descritption goes here",
        dataLogType: "Error (the type could be anything)",
        className: "Home",
        exception: error,
      );
    }
  }

  void logWarning() {
    FLog.warning(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "Log text/descritption goes here",
      dataLogType: "Warning (the type could be anything)",
    );
  }

  void logTrace() {
    FLog.trace(
      className: "HomePage",
      methodName: "_buildRow1",
      text: "Log text/descritption goes here",
      dataLogType: "Trace (the type could be anything)",
    );
  }

  //permission methods:---------------------------------------------------------
  Future<void> requestPermission(Permission permission) => permission.request();
}
