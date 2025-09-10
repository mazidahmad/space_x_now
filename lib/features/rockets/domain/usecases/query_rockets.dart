import 'package:injectable/injectable.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/result.dart';
import '../entities/rocket.dart';
import '../repositories/rocket_repository.dart';

@Injectable()
class QueryRockets implements UseCase<List<Rocket>, Map<String, dynamic>> {
  final RocketRepository _repo = getIt<RocketRepository>();

  @override
  Future<Result<List<Rocket>>> call(Map<String, dynamic> params) async {
    return await _repo.queryRockets(params);
  }
}
