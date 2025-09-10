import 'package:injectable/injectable.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/result.dart';
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
