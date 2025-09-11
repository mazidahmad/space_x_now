import 'package:space_x_now_app/features/main/cubit/app_config/app_config_cubit.dart';
import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../../domain/usecases/get_locale.dart';
import '../../domain/usecases/set_locale.dart';

part 'settings_state.dart';

@Injectable()
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState());

  final GetLocale _getLocale = getIt<GetLocale>();
  final SetLocale _setLocale = getIt<SetLocale>();

  void initialize() async {
    emit(state.copyWith(status: SettingsStatus.loading));
    final result = await _getLocale(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(status: SettingsStatus.failed)),
      (locale) => emit(
        state.copyWith(
          status: SettingsStatus.loaded,
          locale: locale,
        ),
      ),
    );
  }

  void setLocale(String locale) async {
    emit(state.copyWith(status: SettingsStatus.loading));
    final result = await _setLocale(locale);
    result.fold(
      (failure) => emit(state.copyWith(status: SettingsStatus.failed)),
      (_) => emit(
        state.copyWith(
          status: SettingsStatus.loaded,
          locale: locale,
        ),
      ),
    );
  }

  void changeLanguage(String locale) {
    setLocale(locale);
    getIt<AppConfigCubit>().init();
  }
}
