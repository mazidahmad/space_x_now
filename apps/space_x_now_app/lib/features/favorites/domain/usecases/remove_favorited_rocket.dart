import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../repositories/favorites_repository.dart';

@Injectable()
class RemoveFavoritedRocket extends UseCase<void, String> {
  final FavoritesRepository _repo = getIt<FavoritesRepository>();

  @override
  Future<Either<Failure, void>> call(String params) {
    return _repo.removeFavoritedRocket(params);
  }
}
