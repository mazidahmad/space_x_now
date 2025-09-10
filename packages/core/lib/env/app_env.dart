import 'app_env_field.dart';
import 'dev_env.dart';
import 'prod_env.dart';

enum AppFlavor { dev, prod }

abstract interface class AppEnv implements AppEnvFields {
  static AppFlavor? _appFlavor;

  static void initialize(AppFlavor flavor) {
    _appFlavor = flavor;
  }

  factory AppEnv() => _instance;

  static AppEnv get _instance {
    if (_appFlavor == null) {
      throw Exception(
          'AppEnv not initialized. Call AppEnv.initialize() first.');
    }
    return _appFlavor == AppFlavor.dev ? DevEnv() : ProdEnv();
  }
}
