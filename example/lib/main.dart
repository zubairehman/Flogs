import 'package:f_logs/model/datalog/data_log_type.dart';
import 'package:f_logs/model/flog/flog.dart';
import 'package:f_logs/model/flog/flog_config.dart';
import 'package:f_logs/model/flog/log_level.dart';
import 'package:f_logs/utils/filters/filter_type.dart';
import 'package:f_logs/utils/formatter/formate_type.dart';
import 'package:f_logs/utils/timestamp/timestamp_format.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  init();
  runApp(HomePage());
}

init() {
  LogsConfig config = LogsConfig()
    ..isDebuggable = true
    ..isDevelopmentDebuggingEnabled = true
    ..customClosingDivider = "|"
    ..customOpeningDivider = "|"
    ..csvDelimiter = ", "
    ..isLogEnabled = true
    ..encryptionEnabled = false
    ..encryptionKey = "123"
    ..formatType = FormatType.FORMAT_CURLY
    ..logLevelsEnabled = [LogLevel.INFO, LogLevel.ERROR]
    ..dataLogTypes = [
      DataLogType.DEVICE.toString(),
      DataLogType.NETWORK.toString(),
      "Zubair"
    ]
    ..timestampFormat = TimestampFormat.TIME_FORMAT_READABLE;

  FLog.applyConfigurations(config);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //runtime permission
  final PermissionGroup _permissionGroup = PermissionGroup.storage;

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
              _buildRow1(),
              _buildRow2(),
              _buildRow3(),
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

  _buildRow1() {
    return Row(
      children: <Widget>[
        _buildButton("Log Event", () {
          for (int i = 0; i < 2; i++) {
            if (i % 2 == 0) {
              FLog.logThis(
                  className: "HomePage",
                  methodName: "_buildRow1",
                  text: "My log",
                  type: LogLevel.INFO,
                  dataLogType: DataLogType.DEVICE.toString());
            } else {
              FLog.logThis(
                  className: "HomePage",
                  methodName: "_buildRow1",
                  text: "My log",
                  type: LogLevel.ERROR,
                  dataLogType: "Zubair",
                  exception: Exception("This is a test"));
            }
            FLog.logThis(
                className: "HomePage",
                methodName: "_buildRow1",
                text: "My log",
                dataLogType: "Umair",
                type: LogLevel.WARNING);
          }
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
          FLog.printDataLogs(
            dataLogsType: [DataLogType.DEVICE.toString(), "Zubair", "Jawad"],
            logLevels: [LogLevel.ERROR.toString(), LogLevel.WARNING.toString()],
            filterType: FilterType.WEEK
//            startTimeInMillis: 1556132400000,
//            endTimeInMillis: 1556650800000,
          );
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

  //permission methods:---------------------------------------------------------
  Future<void> requestPermission(PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
        await PermissionHandler().requestPermissions(permissions);
  }
}
