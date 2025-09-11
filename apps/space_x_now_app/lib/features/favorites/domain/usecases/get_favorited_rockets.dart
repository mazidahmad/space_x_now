import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';
import 'package:space_x_rockets/domain/entities/rocket.dart';

import '../repositories/favorites_repository.dart';

@Injectable()
class GetFavoritedRockets extends UseCase<List<Rocket>, NoParams> {
  final FavoritesRepository _repo = getIt<FavoritesRepository>();

  @override
  Future<Either<Failure, List<Rocket>>> call(NoParams params) {
    return _repo.getFavoritedRockets();
  }
}
