import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/app/types/sport_type.dart';
import 'package:raketech_task/data/datasources/remote_data_source/mocked_data/mocked_lists.dart';
import 'package:uuid/uuid.dart';

class MockedDataGenerator {
  ///
  ///
  String getRandomDescription() =>
      _getRandomElement(MockedLists.eventsDescriptions, '');

  List<Map<String, dynamic>> createSportEventListForDate(DateType date) {
    List<Map<String, dynamic>> toReturn = [];

    for (var i = 0; i < 30; i++) {
      final sport = SportType.fromInt(Random().nextInt(3));

      sport.when(
        football: () => toReturn.add(
          _createRandomEVent(MockedLists.footBallTeams, sport, date),
        ),
        hockey: () => toReturn.add(
          _createRandomEVent(MockedLists.nbaTeams, sport, date),
        ),
        basketball: () => toReturn.add(
          _createRandomEVent(MockedLists.hockeyTeams, sport, date),
        ),
        unknown: () => DoNothingAction(),
      );
    }

    return toReturn;
  }

  ///
  ///
  Map<String, dynamic> _createRandomEVent(
    List<String> list,
    SportType sport,
    DateType date,
  ) {
    String team1 = _getRandomElement(list, '');
    String team2 = _getRandomElement(list, team1);
    String dateTime = _generateRandomTime();

    return {
      'eventId': const Uuid().v4(),
      'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
      'league': sport.leagueName,
      'teams': '$team1 vs. $team2',
      'sportType': sport.name,
      'dateStarting': date.name,
      'timeStarting': dateTime,
    };
  }

  ///
  ///
  String _generateRandomTime() {
    final random = Random();
    // Generate random hours (0-23) and minutes (0-59)
    int hour = random.nextInt(24);
    int minute = random.nextInt(60);
    // Format the time string

    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  ///
  ///
  String _getRandomElement(List<String> list, String excludedItem) {
    List<String> filteredList =
        list.where((item) => item != excludedItem).toList();

    // Check if there are items left after excluding
    if (filteredList.isEmpty) {
      throw ArgumentError('Excluded item is the only item in the list.');
    }

    // Generate a random index within the filtered list
    Random random = Random();
    int randomIndex = random.nextInt(filteredList.length);

    // Return the randomly selected item
    return filteredList[randomIndex];
  }
}
