import 'package:f_logs/f_logs.dart';
import 'package:sembast/sembast.dart';

class Filters {
  Filters._();

  static List<Filter> generateFilters(
      {List<String> dataLogsType,
      List<String> logLevels,
      int startTimeInMillis,
      int endTimeInMillis,
      FilterType filterType}) {
    //creating list of filters
    List<Filter> filters = List();
    List<Filter> timestampFilters = List();

    //check to see if dataLogsType is not null
    if (dataLogsType != null && dataLogsType.length > 0) {
      Filter dataLogTypeFilter =
          Filter.inList(DBConstants.FIELD_DATA_LOG_TYPE, dataLogsType);
      filters.add(dataLogTypeFilter);
    }

    //check to see if logLevels is not null
    if (logLevels != null && logLevels.length > 0) {
      Filter logLevelsFilter =
          Filter.inList(DBConstants.FIELD_LOG_LEVEL, logLevels);
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
      Filter startTimeFilter = Filter.greaterThan(
          DBConstants.FIELD_TIME_IN_MILLIS, startTimeInMillis);
      filters.add(startTimeFilter);
    }

    //check to see if user provided end time
    if (endTimeInMillis != null) {
      Filter endTimeFilter =
          Filter.lessThan(DBConstants.FIELD_TIME_IN_MILLIS, endTimeInMillis);
      filters.add(endTimeFilter);
    }

    //check to see if user provided FilterType
    //if either start or end time is provided, this will not be executed
    //this will have less priority over them
    if (startTimeInMillis == null &&
        endTimeInMillis == null &&
        filterType != null) {
      int timeInMillis =
          DateTimeUtils.getStartAndEndTimestamps(type: filterType);

      Filter timeFilter =
          Filter.greaterThan(DBConstants.FIELD_TIME_IN_MILLIS, timeInMillis);
      filters.add(timeFilter);
    }

    return filters;
  }
}
