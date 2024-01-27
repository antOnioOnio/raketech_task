import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_remote_entity.freezed.dart';

part 'event_remote_entity.g.dart';

@freezed
class EventRemoteEntity with _$EventRemoteEntity {
  const factory EventRemoteEntity({
    @JsonKey(name: 'league') required String? league,
    @JsonKey(name: 'teams') required String? teams,
    @JsonKey(name: 'sportType') required String? sportType,
    @JsonKey(name: 'dateStarting') required String? date,
    @JsonKey(name: 'timeStarting') required String? timeStarting,
  }) = _EventRemoteEntity;

  factory EventRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$EventRemoteEntityFromJson(json);
}
