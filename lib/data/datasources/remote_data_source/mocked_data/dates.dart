enum Date { yesterday, today, tomorrow }

extension DatesExtension on Date {
  String get name {
    switch (this) {
      case Date.yesterday:
        return 'Yesterday';
      case Date.today:
        return 'Today';
      case Date.tomorrow:
        return 'Tomorrow';
      default:
        return 'null';
    }
  }
}
