import 'dart:async';

import 'package:f_logs/f_logs.dart';
import 'package:sembast/sembast.dart';

import 'app_database.dart';

class FlogDao {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects
  // converted to Map
  final _flogsStore = intMapStoreFactory.store(DBConstants.FLOG_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  // Singleton instance
  static final FlogDao _singleton = FlogDao._();

  /// Singleton accessor
  static FlogDao get instance => _singleton;

  // A private constructor. Allows us to create instances of FlogDao
  // only from within the FlogDao class itself.
  FlogDao._();

  /// DB functions:--------------------------------------------------------------
  Future<int> insert(Log log) async {
    return await _flogsStore.add(await _db, log.toJson());
  }

  /// Updates the `log` in Database
  Future update(Log log) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(log.id));
    await _flogsStore.update(
      await _db,
      log.toJson(),
      finder: finder,
    );
  }

  /// Deletes the `log` from Database
  Future delete(Log log) async {
    final finder = Finder(filter: Filter.byKey(log.id));
    await _flogsStore.delete(
      await _db,
      finder: finder,
    );
  }

  /// Deletes all Logs from Database which match the given `filters`.
  Future<int> deleteAllLogsByFilter({required List<Filter> filters}) async {
    final finder = Finder(
      filter: Filter.and(filters),
    );

    var deleted = await _flogsStore.delete(
      await _db,
      finder: finder,
    );
    return deleted;
  }

  /// Deletes all Logs from Database
  Future deleteAll() async {
    await _flogsStore.delete(
      await _db,
    );
  }

  /// Fetch all Logs which match the given `filters` and sorts them by `dataLogType`
  Future<List<Log>> getAllSortedByFilter(
      {required List<Filter> filters}) async {
    //creating finder
    final finder = Finder(
        filter: Filter.and(filters),
        sortOrders: [SortOrder(DBConstants.FIELD_DATA_LOG_TYPE)]);

    final recordSnapshots = await (_flogsStore.find(
      await _db,
      finder: finder,
    ));

    // Making a List<Log> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final log = Log.fromJson(snapshot.value);
      // An ID is a key of a record from the database.
      log.id = snapshot.key;
      return log;
    }).toList();
  }

  /// fetch all Logs from Database
  Future<List<Log>> getAllLogs() async {
    final recordSnapshots = await (_flogsStore.find(
      await _db,
    ));

    // Making a List<Log> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final log = Log.fromJson(snapshot.value);
      // An ID is a key of a record from the database.
      log.id = snapshot.key;
      return log;
    }).toList();
  }
}
