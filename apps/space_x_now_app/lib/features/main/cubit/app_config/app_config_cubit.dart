import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../../../settings/domain/usecases/get_locale.dart';

part 'app_config_state.dart';

@LazySingleton()
class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit()
      : super(const AppConfigState(
          status: AppConfigStatus.initial,
          locale: 'en',
        ));

  final GetLocale _getLocale = getIt<GetLocale>();

  void init() async {
    emit(state.copyWith(status: AppConfigStatus.loading));
    await Future.delayed(const Duration(milliseconds: 500));
    final result = await _getLocale(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(status: AppConfigStatus.failed)),
      (locale) => emit(
        state.copyWith(
          status: AppConfigStatus.loaded,
          locale: locale,
        ),
      ),
    );
  }
}
