import 'package:space_x_now_core/services/global_service.dart';
import 'package:space_x_now_di/di.dart';

import '../../l10n/app_localizations.dart';

class LocalizationUtil {
  static AppLocalizations? get localization =>
      AppLocalizations.of(getIt<GlobalService>().globalNavKey.currentContext!);
}
