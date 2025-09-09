import 'package:envied/envied.dart';

import 'app_env.dart';
import 'app_env_field.dart';

part 'prod_env.g.dart';

@Envied(name: 'Env', path: '.env.prod')
final class ProdEnv implements AppEnv, AppEnvFields {
  ProdEnv();

  @override
  @EnviedField(varName: "BASE_URL")
  final String baseUrl = _Env.baseUrl;
}
