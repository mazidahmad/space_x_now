import 'package:space_x_now_core/core.dart';
import 'package:space_x_rockets/rockets.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<Rocket>>> getFavoritedRockets();
  Future<Either<Failure, void>> saveFavoritedRocket(Rocket rocket);
  Future<Either<Failure, void>> removeFavoritedRocket(String rocketId);
  Future<Either<Failure, bool>> isRocketFavorited(String rocketId);
}
