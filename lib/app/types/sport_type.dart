import 'package:freezed_annotation/freezed_annotation.dart';

part 'sport_type.freezed.dart';

@freezed
class SportType with _$SportType {
  const factory SportType.football() = _Football;

  const factory SportType.hockey() = _Hockey;

  const factory SportType.basketball() = _Basketball;

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

    return const SportType.football();
  }
}

extension SportTypeExtension on SportType {
  String get name => when(
        football: () => 'Football',
        hockey: () => 'Hockey',
        basketball: () => 'Basketball',
      );

  String get leagueName => when(
        football: () => 'Serie A',
        hockey: () => 'NHL',
        basketball: () => 'NBA',
      );
}
