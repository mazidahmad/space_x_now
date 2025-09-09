import '../../../flavors.dart';
import 'app_env_field.dart';
import 'dev_env.dart';
import 'prod_env.dart';

abstract interface class AppEnv implements AppEnvFields {
  factory AppEnv() => _instance;

  static final AppEnv _instance =
      F.appFlavor == Flavor.dev ? DevEnv() : ProdEnv();
}
