import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/data/datasources/remote_data_source/api/event_api.dart';
import 'package:raketech_task/data/models/event_remote_entity.dart';
import 'package:raketech_task/data/repositories/data_source_contracts/remote/events_remote_data_source_contract.dart';

class EventsRemoteDataSource implements EventsRemoteDataSourceContract {
  final EventsApi _api;

  EventsRemoteDataSource({required EventsApi api}) : _api = api;

  @override
  Future<List<EventRemoteEntity>> getEventsByDate(DateType dateType) async =>
      await _api.getEventsByDate(dateType);

  @override
  Future<String> getEventDescription(String eventId) async =>
      await _api.getEventDescription(eventId);
}
