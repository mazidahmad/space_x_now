import 'package:space_x_now_di/di.dart';

import 'launchpad_di.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void launchpadDI() => getIt.init();
