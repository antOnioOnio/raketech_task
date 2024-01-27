part of '../di.dart';

final apiModulesDi = GetIt.instance;

void _apiModulesInit() {
  apiModulesDi.registerLazySingleton(
    () => EventsApi(
      dataGenerator: MockedDataGenerator(),
    ),
  );
}
