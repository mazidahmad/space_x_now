import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';
import 'package:space_x_rockets/domain/entities/rocket.dart';

import '../repositories/favorites_repository.dart';

@Injectable()
class SaveFavoritedRocket extends UseCase<void, Rocket> {
  final FavoritesRepository _repo = getIt<FavoritesRepository>();

  @override
  Future<Either<Failure, void>> call(Rocket params) {
    return _repo.saveFavoritedRocket(params);
  }
}
