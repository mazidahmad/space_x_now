import 'package:logger/logger.dart';
import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

class CoreDi {
  CoreDi() {
    _initializeDi();
  }

  void _initializeDi() {
    getIt.registerSingleton(Logger());
    getIt.registerLazySingleton(() => HttpModule(baseUrl: AppEnv().baseUrl));
    getIt.registerLazySingleton(() => GlobalService());
    getIt.registerLazySingleton(() => CachedStorage()..init(BoxName.appCache));
  }
}
