import 'package:space_x_now_core/core.dart';

import '../entities/launch.dart';
import '../repositories/launch_repository.dart';

@Injectable()
class GetAllLaunches implements UseCase<List<Launch>, NoParams> {
  final LaunchRepository _repo = getIt<LaunchRepository>();

  @override
  Future<Result<List<Launch>>> call(NoParams params) async {
    return await _repo.getAllLaunches();
  }
}
