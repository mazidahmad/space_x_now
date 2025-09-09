import 'package:injectable/injectable.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/result.dart';
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
