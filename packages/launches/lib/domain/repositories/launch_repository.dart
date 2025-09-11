import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_core/entities/query_response.dart';

import '../entities/launch.dart';

abstract class LaunchRepository {
  Future<Either<Failure, List<Launch>>> getAllLaunches();
  Future<Either<Failure, Launch>> getLaunchById(String id);
  Future<Either<Failure, Launch?>> getLatestLaunch();
  Future<Either<Failure, Launch?>> getNextLaunch();
  Future<Either<Failure, List<Launch>>> getPastLaunches();
  Future<Either<Failure, List<Launch>>> getUpcomingLaunches();
  Future<Either<Failure, QueryResponse<Launch>>> queryLaunches(
      Map<String, dynamic> query);
}
