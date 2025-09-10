import 'package:space_x_now_di/di.dart';

import 'rockets_di.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void rocketsDI() => getIt.init();
