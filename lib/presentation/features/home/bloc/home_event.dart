part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchEventsByDate(DateType dateType) =
      _FetchEventByType;

  const factory HomeEvent.fetchEventDetails(String eventId) =
      _FetchEventDetails;

  const factory HomeEvent.updateEventSelected({
    required EventEntity? event,
    required DateType dateType,
  }) = _UpdatedEventSelected;
}
