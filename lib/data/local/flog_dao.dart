import 'package:f_logs/constants/db_constants.dart';
import 'package:f_logs/data/local/app_database.dart';
import 'package:f_logs/model/flog/log.dart';
import 'package:sembast/sembast.dart';

class FlogDao {

  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _flogsStore = intMapStoreFactory.store(DBConstants.FLOG_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  // Singleton instance
  static final FlogDao _singleton = FlogDao._();

  // Singleton accessor
  static FlogDao get instance => _singleton;

  // A private constructor. Allows us to create instances of FlogDao
  // only from within the FlogDao class itself.
  FlogDao._();

  // DB functions:--------------------------------------------------------------
  Future<int> insert(Log log) async {
    return await _flogsStore.add(await _db, log.toMap());
  }

  Future update(Log log) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(log.id));
    await _flogsStore.update(
      await _db,
      log.toMap(),
      finder: finder,
    );
  }

  Future delete(Log log) async {
    final finder = Finder(filter: Filter.byKey(log.id));
    await _flogsStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _flogsStore.drop(
      await _db,
    );
  }

  Future<List<Log>> getAllSortedByLogType(
      {List<String> dataLogsType,
      List<String> logLevels,
      int startTimeInMillis,
      int endTimeInMillis}) async {

    //creating list of filters
    List<Filter> filters = List();
    List<Filter> timestampFilters = List();

    //check to see if dataLogsType is not null
    if (dataLogsType != null && dataLogsType.length > 0) {
      Filter dataLogTypeFilter = Filter.inList(DBConstants.FIELD_DATA_LOG_TYPE, dataLogsType);
      filters.add(dataLogTypeFilter);
    }

    //check to see if logLevels is not null
    if (logLevels != null && logLevels.length > 0) {
      Filter logLevelsFilter = Filter.inList(DBConstants.FIELD_LOG_LEVEL, logLevels);
      filters.add(logLevelsFilter);
    }

    //check to see if both start and end times are provided
    if (startTimeInMillis != null && endTimeInMillis != null) {
      timestampFilters = [
        Filter.greaterThan(DBConstants.FIELD_TIME_IN_MILLIS, startTimeInMillis),
        Filter.lessThan(DBConstants.FIELD_TIME_IN_MILLIS, endTimeInMillis)
      ];

      filters.addAll(timestampFilters);
    }

    //check to see if user provided start time
    if (startTimeInMillis != null) {
      Filter startTimeFilter =
          Filter.greaterThan(DBConstants.FIELD_TIME_IN_MILLIS, startTimeInMillis);
      filters.add(startTimeFilter);
    }

    //check to see if user provided end time
    if (endTimeInMillis != null) {
      Filter endTimeFilter = Filter.lessThan(DBConstants.FIELD_TIME_IN_MILLIS, endTimeInMillis);
      filters.add(endTimeFilter);
    }

    //creating finder
    final finder = Finder(
        filter: Filter.and(filters), sortOrders: [SortOrder(DBConstants.FIELD_DATA_LOG_TYPE)]);

    final recordSnapshots = await _flogsStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Log> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final log = Log.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      log.id = snapshot.key;
      return log;
    }).toList();
  }

  Future<List<Log>> getAllSortedByFilter(
      {List<Filter> filters}) async {

    //creating finder
    final finder = Finder(
        filter: Filter.and(filters), sortOrders: [SortOrder(DBConstants.FIELD_DATA_LOG_TYPE)]);

    final recordSnapshots = await _flogsStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Log> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final log = Log.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      log.id = snapshot.key;
      return log;
    }).toList();
  }


  Future<List<Log>> getAllLogs() async {
    final recordSnapshots = await _flogsStore.find(
      await _db,
    );

    // Making a List<Log> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final log = Log.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      log.id = snapshot.key;
      return log;
    }).toList();
  }
}
