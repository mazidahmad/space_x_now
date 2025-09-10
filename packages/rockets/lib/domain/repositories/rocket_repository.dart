import 'package:space_x_now_core/utils/result.dart';

import '../entities/rocket.dart';

abstract class RocketRepository {
  Future<Result<List<Rocket>>> getAllRockets();
  Future<Result<Rocket>> getRocketById(String id);
  Future<Result<List<Rocket>>> queryRockets(Map<String, dynamic> query);
}
