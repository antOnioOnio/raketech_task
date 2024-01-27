import 'dart:math';

import 'package:raketech_task/data/datasources/remote_data_source/mocked_data/dates.dart';
import 'package:raketech_task/data/datasources/remote_data_source/mocked_data/mocked_lists.dart';
import 'package:raketech_task/data/datasources/remote_data_source/mocked_data/sport.dart';

abstract class MockedData {
  List<Map<String, dynamic>> createSportEventList() {
    List<Map<String, dynamic>> toReturn = [];

    for (var i = 0; i < 30; i++) {
      switch (Sport.values[Random().nextInt(Sport.values.length)]) {
        case Sport.football:
          _createRandomEVent(MockedLists.footBallTeams, Sport.football);
          break;
        case Sport.basketball:
          _createRandomEVent(MockedLists.nbaTeams, Sport.basketball);
          break;
        case Sport.hockey:
          _createRandomEVent(MockedLists.hockeyTeams, Sport.hockey);
          break;
      }
    }

    return toReturn;
  }

  Map<String, dynamic> _createRandomEVent(List<String> list, Sport sport) {
    String team1 = _getRandomElement(list, '');
    String team2 = _getRandomElement(list, team1);
    String date = Date.values[Random().nextInt(Date.values.length)].name;
    String dateTime = _generateRandomTime();

    return {
      'league': sport.leagueName,
      'teams': '$team1 vs. $team2',
      'sportType': sport.name,
      'dateStarting': date,
      'timeStarting': dateTime,
    };
  }

  String _generateRandomTime() {
    final random = Random();
    // Generate random hours (0-23) and minutes (0-59)
    int hour = random.nextInt(24);
    int minute = random.nextInt(60);
    // Format the time string

    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  String _getRandomElement(List<String> list, String exclude) {
    final random = Random();
    // Shuffle the list to randomize the order
    list.shuffle(random);
    // Iterate through the shuffled list
    for (String element in list) {
      // Return a random element if it's not the excluded one
      if (element != exclude) {
        return element;
      }
    }
    // If the excluded element is the only one in the list, return empty string
    return '';
  }
}
