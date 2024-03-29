import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/app/types/sport_type.dart';
import 'package:raketech_task/data/models/event_remote_entity.dart';

part 'event_entity.freezed.dart';

@freezed
class EventEntity with _$EventEntity {
  const factory EventEntity({
    String? eventId,
    String? iconUrl,
    String? league,
    String? teams,
    SportType? sportType,
    DateType? date,
    String? timeStarting,
    String? eventDescription,
  }) = _EventEntity;
}

extension EventRemoteEntityExtension on EventRemoteEntity {
  EventEntity toEventEntity() => EventEntity(
        eventId: eventId,
        iconUrl: iconUrl,
        league: league,
        teams: teams,
        sportType: SportType.fromString(sportType ?? ''),
        date: DateType.fromString(date ?? ''),
        timeStarting: timeStarting,
        eventDescription: eventDescription,
      );
}
