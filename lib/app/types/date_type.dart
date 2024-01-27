import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_type.freezed.dart';

@freezed
class DateType with _$DateType {
  const factory DateType.yesterday() = _Yesterday;

  const factory DateType.today() = _Today;

  const factory DateType.tomorrow() = _Tomorrow;
}

extension DateTypeExtension on DateType {
  String get name => when(
        yesterday: () => 'Yesterday',
        today: () => 'Today',
        tomorrow: () => 'Tomorrow',
      );
}
