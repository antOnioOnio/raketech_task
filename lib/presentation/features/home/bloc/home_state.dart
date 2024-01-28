part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required ScreenStatus screenStatus,
    required List<EventEntity> yesterdayEvents,
    required List<EventEntity> todayEvents,
    required List<EventEntity> tomorrowEvents,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(
      screenStatus: ScreenStatus.initial(),
      yesterdayEvents: [],
      todayEvents: [],
      tomorrowEvents: [],
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
}
