import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_remote_entity.freezed.dart';

part 'event_remote_entity.g.dart';

@freezed
class EventRemoteEntity with _$EventRemoteEntity {
  const factory EventRemoteEntity({
    @JsonKey(name: 'league') String? league,
    @JsonKey(name: 'iconUrl') String? iconUrl,
    @JsonKey(name: 'teams') String? teams,
    @JsonKey(name: 'sportType') String? sportType,
    @JsonKey(name: 'dateStarting') String? date,
    @JsonKey(name: 'timeStarting') String? timeStarting,
  }) = _EventRemoteEntity;

  factory EventRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$EventRemoteEntityFromJson(json);
}
