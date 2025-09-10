import 'package:space_x_now_di/di.dart';

import 'app_di.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void appDI() => getIt.init();
