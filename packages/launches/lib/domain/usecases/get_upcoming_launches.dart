import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../entities/launch.dart';
import '../repositories/launch_repository.dart';

@Injectable()
class GetUpcomingLaunches implements UseCase<List<Launch>, NoParams> {
  final LaunchRepository _repo = getIt<LaunchRepository>();

  @override
  Future<Either<Failure, List<Launch>>> call(NoParams params) async {
    return await _repo.getUpcomingLaunches();
  }
}
