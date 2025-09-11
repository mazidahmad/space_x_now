import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../repositories/favorites_repository.dart';

@Injectable()
class IsRocketFavorited extends UseCase<bool, String> {
  final FavoritesRepository _repo = getIt<FavoritesRepository>();

  @override
  Future<Either<Failure, bool>> call(String params) {
    return _repo.isRocketFavorited(params);
  }
}
