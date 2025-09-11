import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../entities/payload.dart';
import '../repositories/payload_repository.dart';

@Injectable()
class GetPayloadById implements UseCase<Payload, String> {
  final PayloadRepository _repo = getIt<PayloadRepository>();

  @override
  Future<Either<Failure, Payload>> call(String id) async {
    return await _repo.getPayloadById(id);
  }
}
