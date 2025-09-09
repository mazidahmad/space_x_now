import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../env/app_env.dart';
import '../modules/http_module.dart';
import '../services/global_service.dart';
import '../storages/cached_storage.dart';

@module
abstract class RegisterModule {
  @Singleton()
  Logger get logger => Logger(printer: SimplePrinter());

  @LazySingleton()
  HttpModule get httpModule => HttpModule(baseUrl: AppEnv().baseUrl);

  @LazySingleton()
  GlobalService get globalService => GlobalService();

  @LazySingleton()
  CachedStorage get cachedStorage => CachedStorage()..init(BoxName.appCache);
}
