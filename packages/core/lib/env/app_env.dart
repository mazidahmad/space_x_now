import 'package:flutter/services.dart' as F;
import 'package:space_x_now_di/di.dart' as Flavor;

import 'app_env_field.dart';
import 'dev_env.dart';
import 'prod_env.dart';

enum AppFlavor { dev, prod }

abstract interface class AppEnv implements AppEnvFields {
  factory AppEnv() => _instance;

  static final AppEnv _instance =
      F.appFlavor == Flavor.dev ? DevEnv() : ProdEnv();
}
