import 'package:space_x_now_core/core.dart';

import '../entities/launch.dart';

abstract class LaunchRepository {
  Future<Result<List<Launch>>> getAllLaunches();
  Future<Result<Launch>> getLaunchById(String id);
  Future<Result<Launch?>> getLatestLaunch();
  Future<Result<Launch?>> getNextLaunch();
  Future<Result<List<Launch>>> getPastLaunches();
  Future<Result<List<Launch>>> getUpcomingLaunches();
  Future<Result<List<Launch>>> queryLaunches(Map<String, dynamic> query);
}
