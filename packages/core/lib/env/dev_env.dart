import 'package:envied/envied.dart';

import 'app_env.dart';
import 'app_env_field.dart';

part 'dev_env.g.dart';

@Envied(name: 'Env', path: '.env.dev')
final class DevEnv implements AppEnv, AppEnvFields {
  DevEnv();

  @override
  @EnviedField(varName: "BASE_URL")
  final String baseUrl = _Env.baseUrl;
}
