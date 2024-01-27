import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/data/datasources/remote_data_source/mocked_data/mocked_data.dart';
import 'package:raketech_task/data/models/event_remote_entity.dart';

class EventsApi {
  /// This method return a lsit of EventRemoteEntity, it is just mocked for the moment
  /// as we don't have a proper API.
  Future<List<EventRemoteEntity>> getEventsByDate(DateType dateType) async {
    await Future.delayed(const Duration(milliseconds: 400));

    final mockedResponse =
        MockedDataGenerator().createSportEventListForDate(dateType);

    return mockedResponse.map((e) => EventRemoteEntity.fromJson(e)).toList();
  }
}
