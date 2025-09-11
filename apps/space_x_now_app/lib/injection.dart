import 'package:space_x_launches/di/launches_di.dart';
import 'package:space_x_launchpad/di/launchpad_di.dart';
import 'package:space_x_now_core/di/core_di.dart';
import 'package:space_x_payload/di/payload_di.dart';
import 'package:space_x_rockets/di/rockets_di.dart';

import 'di/app_di.dart';

class Injection {
  static void configureDependencies() {
    coreDI();
    launchesDI();
    appDI();
    rocketsDI();
    launchpadDI();
    payloadDI();
  }
}
