import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../entities/launchpad.dart';
import '../repositories/launchpad_repository.dart';

@Injectable()
class GetAllLaunchPads implements UseCase<List<LaunchPad>, NoParams> {
  final LaunchPadRepository _repo = getIt<LaunchPadRepository>();
  @override
  Future<Either<Failure, List<LaunchPad>>> call(NoParams params) async {
    return await _repo.getAllLaunchPads();
  }
}
