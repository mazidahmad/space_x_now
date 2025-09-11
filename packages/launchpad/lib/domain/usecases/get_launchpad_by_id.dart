import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../entities/launchpad.dart';
import '../repositories/launchpad_repository.dart';

@Injectable()
class GetLaunchPadById implements UseCase<LaunchPad, String> {
  final LaunchPadRepository _repo = getIt<LaunchPadRepository>();

  @override
  Future<Either<Failure, LaunchPad>> call(String id) async {
    return await _repo.getLaunchPadById(id);
  }
}
