import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/app/types/result.dart';
import 'package:raketech_task/domain/models/event_entity.dart';

abstract class EventsRepositoryContract {
  Future<Result<List<EventEntity>>> getListOfEventsByDate(DateType dateType);
}
