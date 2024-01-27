import 'package:freezed_annotation/freezed_annotation.dart';

part 'sport_type.freezed.dart';

@freezed
class SportType with _$SportType {
  static const String _footballName = 'Football';
  static const String _basketballName = 'Basketball';
  static const String _hockeyName = 'Hockey';

  const factory SportType.football() = _Football;

  const factory SportType.hockey() = _Hockey;

  const factory SportType.basketball() = _Basketball;

  const factory SportType.unknown() = _Unknown;

  factory SportType.fromString(String sportName) {
    switch (sportName) {
      case _footballName:
        return const SportType.football();
      case _hockeyName:
        return const SportType.hockey();
      case _basketballName:
        return const SportType.basketball();
    }

    ///should not happen as we cover all possible scenarios
    return const SportType.unknown();
  }

  ///Just added for mocking purposes
  factory SportType.fromInt(int i) {
    switch (i) {
      case 0:
        return const SportType.football();
      case 1:
        return const SportType.hockey();
      case 2:
        return const SportType.basketball();
    }

    ///should not happen
    return const SportType.unknown();
  }
}

extension SportTypeExtension on SportType {
  String get name => when(
        football: () => SportType._footballName,
        hockey: () => SportType._hockeyName,
        basketball: () => SportType._basketballName,
        unknown: () => '',
      );

  String get leagueName => when(
        football: () => 'Serie A',
        hockey: () => 'NHL',
        basketball: () => 'NBA',
        unknown: () => '',
      );
}
