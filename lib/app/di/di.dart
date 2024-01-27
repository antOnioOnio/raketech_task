import 'package:get_it/get_it.dart';
import 'package:raketech_task/data/datasources/remote_data_source/api/event_api.dart';
import 'package:raketech_task/data/datasources/remote_data_source/mocked_data/mocked_data.dart';
part 'modules/api_modules.dart';

/*part 'modules/local_modules.dart';

part 'modules/remote_modules.dart';

part 'modules/repository_modules.dart';

part 'modules/ui_modules.dart';*/


void initDi() {
  _apiModulesInit();
/*  _remoteModulesInit();
  _localModulesInit(instance: await SharedPreferences.getInstance());
  _repositoryModulesInit();
  _uiModulesInit();*/
}
