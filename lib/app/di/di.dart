import 'package:get_it/get_it.dart';
import 'package:raketech_task/data/datasources/remote_data_source/api/event_api.dart';
import 'package:raketech_task/data/datasources/remote_data_source/events_remote_data_source.dart';
import 'package:raketech_task/data/datasources/remote_data_source/mocked_data/mocked_data.dart';
import 'package:raketech_task/data/repositories/data_source_contracts/remote/events_remote_data_source_contract.dart';
import 'package:raketech_task/data/repositories/events_repository.dart';
import 'package:raketech_task/domain/repositoriy_contracts/events_repository_contract.dart';
import 'package:raketech_task/presentation/features/splash/splash_bloc/splash_bloc.dart';
import 'package:raketech_task/presentation/top_blocs/language_bloc/language_bloc.dart';

part 'modules/api_modules.dart';

part 'modules/remote_modules.dart';

part 'modules/repository_modules.dart';

part 'modules/ui_modules.dart';

void initDi() {
  _apiModulesInit();
  _remoteModulesInit();
  _repositoryModulesInit();
  _uiModulesInit();
}
