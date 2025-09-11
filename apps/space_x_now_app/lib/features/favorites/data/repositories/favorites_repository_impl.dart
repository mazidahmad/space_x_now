import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';
import 'package:space_x_rockets/domain/entities/rocket.dart';

import '../../domain/repositories/favorites_repository.dart';
import '../data/favorites_local_datasources.dart';

@Injectable(as: FavoritesRepository)
class FavoritesRepositoryImpl extends FavoritesRepository with RepositoryMixin {
  final FavoritesLocalDataSource _localDataSource =
      getIt<FavoritesLocalDataSource>();

  @override
  Future<Either<Failure, List<Rocket>>> getFavoritedRockets() => callDataSource(
        () => _localDataSource.getFavoritedRockets(),
      );

  @override
  Future<Either<Failure, bool>> isRocketFavorited(String rocketId) =>
      callDataSource(
        () => _localDataSource.isRocketFavorited(rocketId),
      );

  @override
  Future<Either<Failure, void>> removeFavoritedRocket(String rocketId) =>
      callDataSource(
        () => _localDataSource.removeFavoritedRocket(rocketId),
      );

  @override
  Future<Either<Failure, void>> saveFavoritedRocket(Rocket rocket) =>
      callDataSource(
        () => _localDataSource.saveFavoritedRocket(rocket.toModel()),
      );
}
