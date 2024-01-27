part of '../di.dart';

final repositoryModulesDi = GetIt.instance;

void _repositoryModulesInit() {
  repositoryModulesDi.registerLazySingleton<EventsRepositoryContract>(
    () => EventsRepository(
      eventsRemoteDataSourceContract: repositoryModulesDi(),
    ),
  );
}
