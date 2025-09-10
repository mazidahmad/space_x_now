import 'package:space_x_now_core/core.dart';

import '../entities/launch.dart';
import '../repositories/launch_repository.dart';

@Injectable()
class GetLatestLaunch implements UseCase<Launch?, NoParams> {
  final LaunchRepository _repo = getIt<LaunchRepository>();

  @override
  Future<Result<Launch?>> call(NoParams params) async {
    return await _repo.getLatestLaunch();
  }
}
