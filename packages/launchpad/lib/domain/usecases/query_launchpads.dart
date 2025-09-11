import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../entities/launchpad.dart';
import '../repositories/launchpad_repository.dart';

@Injectable()
class QueryLaunchPads
    implements UseCase<List<LaunchPad>, Map<String, dynamic>> {
  final LaunchPadRepository _repo = getIt<LaunchPadRepository>();

  @override
  Future<Either<Failure, List<LaunchPad>>> call(
      Map<String, dynamic> query) async {
    return await _repo.queryLaunchPads(query);
  }
}
