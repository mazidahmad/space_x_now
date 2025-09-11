import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_core/entities/query_response.dart';

import '../entities/rocket.dart';

abstract class RocketRepository {
  Future<Either<Failure, List<Rocket>>> getAllRockets();
  Future<Either<Failure, Rocket>> getRocketById(String id);
  Future<Either<Failure, QueryResponse<Rocket>>> queryRockets(
      Map<String, dynamic> query);
}
