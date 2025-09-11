import 'package:space_x_now_di/di.dart';

import 'payload_di.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void payloadDI() => getIt.init();
