import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/data/models/event_remote_entity.dart';

abstract class EventsRemoteDataSourceContract {
  Future<List<EventRemoteEntity>> getEventsByDate(DateType dateType);
  Future<String> getEventDescription(String eventId);
}
