import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_type.freezed.dart';

@freezed
class DateType with _$DateType {
  static const String _yesterday = 'Yesterday';
  static const String _today = 'Today';
  static const String _tomorrow = 'Tomorrow';

  const factory DateType.yesterday() = _Yesterday;

  const factory DateType.today() = _Today;

  const factory DateType.tomorrow() = _Tomorrow;

  const factory DateType.unknown() = _Unknown;

  factory DateType.fromString(String sportName) {
    switch (sportName) {
      case _yesterday:
        return const DateType.yesterday();
      case _today:
        return const DateType.today();
      case _tomorrow:
        return const DateType.tomorrow();
    }

    ///should not happen as we cover all possible scenarios
    return const DateType.unknown();
  }

  ///added to be able to transform integer tab to datetype
  factory DateType.fromInt(int i) {
    switch (i) {
      case 0:
        return const DateType.yesterday();
      case 1:
        return const DateType.today();
      case 2:
        return const DateType.tomorrow();
    }

    ///should not happen as we cover all possible scenarios
    return const DateType.unknown();
  }
}

extension DateTypeExtension on DateType {
  String get name => when(
        yesterday: () => DateType._yesterday,
        today: () => DateType._today,
        tomorrow: () => DateType._tomorrow,
        unknown: () => '',
      );
}
