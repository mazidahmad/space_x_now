import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';
import 'package:space_x_rockets/rockets.dart';

import '../../../domain/usecases/get_favorited_rockets.dart';

part 'favorites_state.dart';

@Injectable()
class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState());

  final GetFavoritedRockets _getFavoritedRockets = getIt<GetFavoritedRockets>();

  void initialize() async {
    emit(state.copyWith(status: FavoritesStatus.loading));
    final result = await _getFavoritedRockets.call(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(
        status: FavoritesStatus.failed,
        failure: failure,
      )),
      (rockets) => emit(state.copyWith(
        status: FavoritesStatus.loaded,
        rockets: rockets,
      )),
    );
  }
}
