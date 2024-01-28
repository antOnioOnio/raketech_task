part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required ScreenStatus screenStatus,
    required List<EventEntity> yesterdayEvents,
    EventEntity? yesterdayEventSelected,
    required List<EventEntity> todayEvents,
    EventEntity? todayEventSelected,
    required List<EventEntity> tomorrowEvents,
    EventEntity? tomorrowEventSelected,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(
      screenStatus: ScreenStatus.initial(),
      yesterdayEvents: [],
      todayEvents: [],
      tomorrowEvents: [],
      yesterdayEventSelected: null,
      todayEventSelected: null,
      tomorrowEventSelected: null,
    );
  }
}

extension HomeStateExtension on HomeState {
  List<EventEntity> getListByDate(DateType dateType) => dateType.when(
        yesterday: () => yesterdayEvents,
        today: () => todayEvents,
        tomorrow: () => tomorrowEvents,
        unknown: () => [],
      );

  EventEntity? getEventSelectedForDate(DateType dateType) => dateType.when(
        yesterday: () => yesterdayEventSelected,
        today: () => todayEventSelected,
        tomorrow: () => tomorrowEventSelected,
        unknown: () => null,
      );
}
