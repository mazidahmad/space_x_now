import 'package:space_x_now_di/di.dart';

import 'launches_di.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void launchesDI() => getIt.init();
