import 'package:injectable/injectable.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/result.dart';
import '../entities/launch.dart';
import '../repositories/launch_repository.dart';

@Injectable()
class GetLaunchById implements UseCase<Launch, String> {
  final LaunchRepository _repo = getIt<LaunchRepository>();

  @override
  Future<Result<Launch>> call(String params) async {
    return await _repo.getLaunchById(params);
  }
}
