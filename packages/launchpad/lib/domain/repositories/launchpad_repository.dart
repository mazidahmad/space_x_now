import 'package:space_x_now_core/core.dart';

import '../entities/launchpad.dart';

abstract class LaunchPadRepository {
  Future<Either<Failure, List<LaunchPad>>> getAllLaunchPads();
  Future<Either<Failure, LaunchPad>> getLaunchPadById(String id);
  Future<Either<Failure, List<LaunchPad>>> queryLaunchPads(
      Map<String, dynamic> query);
}
