import 'package:space_x_now_di/di.dart';

import 'core_di.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void coreDI() => getIt.init();
