import 'package:space_x_launches/di/launches_di.dart';
import 'package:space_x_rockets/di/rockets_di.dart';

import 'di/app_di.dart';

class Injection {
  static void configureDependencies() {
    launchesDI();
    appDI();
    rocketsDI();
  }
}
