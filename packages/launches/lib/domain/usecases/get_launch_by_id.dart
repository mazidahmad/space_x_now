import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../entities/launch.dart';
import '../repositories/launch_repository.dart';

@Injectable()
class GetLaunchById implements UseCase<Launch, String> {
  final LaunchRepository _repo = getIt<LaunchRepository>();

  @override
  Future<Either<Failure, Launch>> call(String params) async {
    return await _repo.getLaunchById(params);
  }
}
