import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';
import 'package:space_x_rockets/rockets.dart';

import '../../../../favorites/domain/usecases/is_rocket_favorited.dart';
import '../../../../favorites/domain/usecases/remove_favorited_rocket.dart';
import '../../../../favorites/domain/usecases/save_favorited_rocket.dart';

part 'rocket_detail_state.dart';

@Injectable()
class RocketDetailCubit extends Cubit<RocketDetailState> {
  RocketDetailCubit() : super(RocketDetailState());

  final IsRocketFavorited _isRocketFavorited = getIt<IsRocketFavorited>();
  final SaveFavoritedRocket _saveFavoritedRocket = getIt<SaveFavoritedRocket>();
  final RemoveFavoritedRocket _removeFavoritedRocket =
      getIt<RemoveFavoritedRocket>();

  void checkIfRocketIsFavorited(String rocketId) async {
    emit(state.copyWith(status: RocketDetailStatus.loading));

    final result = await _isRocketFavorited.call(rocketId);

    result.fold(
      (failure) => emit(state.copyWith(
        status: RocketDetailStatus.failure,
        failure: failure,
      )),
      (isFavorited) => emit(state.copyWith(
        status: RocketDetailStatus.success,
        isFavorited: isFavorited,
      )),
    );
  }

  void toggleFavoriteStatus(Rocket rocket) async {
    if (state.isFavorited) {
      final result = await _removeFavoritedRocket.call(rocket.id);

      result.fold(
        (failure) => emit(state.copyWith(
          status: RocketDetailStatus.failure,
          failure: failure,
        )),
        (_) => emit(state.copyWith(
          status: RocketDetailStatus.success,
          isFavorited: false,
        )),
      );
    } else {
      final result = await _saveFavoritedRocket.call(rocket);

      result.fold(
        (failure) => emit(state.copyWith(
          status: RocketDetailStatus.failure,
          failure: failure,
        )),
        (_) => emit(state.copyWith(
          status: RocketDetailStatus.success,
          isFavorited: true,
        )),
      );
    }
  }
}
