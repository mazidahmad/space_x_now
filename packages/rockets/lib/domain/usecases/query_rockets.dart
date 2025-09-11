import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_core/entities/query_response.dart';
import 'package:space_x_now_di/di.dart';

import '../entities/rocket.dart';
import '../repositories/rocket_repository.dart';

@Injectable()
class QueryRockets
    implements UseCase<QueryResponse<Rocket>, Map<String, dynamic>> {
  final RocketRepository _repo = getIt<RocketRepository>();

  @override
  Future<Either<Failure, QueryResponse<Rocket>>> call(
      Map<String, dynamic> params) async {
    return await _repo.queryRockets(params);
  }
}
