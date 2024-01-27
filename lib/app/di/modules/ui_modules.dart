part of '../di.dart';

final uiModulesDi = GetIt.instance;

void _uiModulesInit() {
  uiModulesDi.registerFactory(
    () => LanguagesBloc(),
  );
  uiModulesDi.registerFactory(
    () => SplashBloc(),
  );
}
