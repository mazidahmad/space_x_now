import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../entities/payload.dart';
import '../repositories/payload_repository.dart';

@Injectable()
class GetAllPayloads implements UseCase<List<Payload>, NoParams> {
  final PayloadRepository _repo = getIt<PayloadRepository>();

  @override
  Future<Either<Failure, List<Payload>>> call(NoParams params) async {
    return await _repo.getAllPayloads();
  }
}
