part of '../di.dart';

final remoteModulesDi = GetIt.instance;

void _remoteModulesInit() {
  // Data sources
  remoteModulesDi.registerLazySingleton<EventsRemoteDataSourceContract>(
    () => EventsRemoteDataSource(
      api: remoteModulesDi(),
    ),
  );
}
