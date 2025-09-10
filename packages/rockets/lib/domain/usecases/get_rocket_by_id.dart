import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../entities/rocket.dart';
import '../repositories/rocket_repository.dart';

@Injectable()
class GetRocketById implements UseCase<Rocket, String> {
  final RocketRepository _repo = getIt<RocketRepository>();

  @override
  Future<Result<Rocket>> call(String params) async {
    return await _repo.getRocketById(params);
  }
}
