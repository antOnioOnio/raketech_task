import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/data/datasources/remote_data_source/mocked_data/mocked_data.dart';
import 'package:raketech_task/data/models/event_remote_entity.dart';

class EventsApi {
  final MockedDataGenerator _dataGenerator;

  EventsApi({required MockedDataGenerator dataGenerator})
      : _dataGenerator = dataGenerator;

  /// This method return a list of EventRemoteEntity, it is just mocked for the moment
  /// as we don't have a proper API.
  Future<List<EventRemoteEntity>> getEventsByDate(DateType dateType) async {
    //Faked delay
    await Future.delayed(const Duration(seconds: 1));

    final mockedResponse = _dataGenerator.createSportEventListForDate(dateType);

    return mockedResponse.map((e) => EventRemoteEntity.fromJson(e)).toList();
  }

  /// This method return an event description, it is just mocked for the moment
  /// as we don't have a proper API.
  Future<String> getEventDescription(String eventId) async {
    //Faked delay
    await Future.delayed(const Duration(seconds: 1));

    return _dataGenerator.getRandomDescription();
  }
}
