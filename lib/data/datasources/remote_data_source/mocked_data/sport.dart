enum Sport { football, hockey, basketball }

extension SportExtension on Sport {
  String get name {
    switch (this) {
      case Sport.football:
        return 'Football';
      case Sport.hockey:
        return 'Hockey';
      case Sport.basketball:
        return 'Basketball';
      default:
        return 'null';
    }
  }

  String get leagueName {
    switch (this) {
      case Sport.football:
        return 'Serie A';
      case Sport.hockey:
        return 'NHL';
      case Sport.basketball:
        return 'NBA';
      default:
        return 'null';
    }
  }
}
