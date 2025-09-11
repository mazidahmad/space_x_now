import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../entities/payload.dart';
import '../repositories/payload_repository.dart';

@Injectable()
class QueryPayloads implements UseCase<List<Payload>, Map<String, dynamic>> {
  final PayloadRepository _repo = getIt<PayloadRepository>();

  @override
  Future<Either<Failure, List<Payload>>> call(
      Map<String, dynamic> query) async {
    return await _repo.queryPayloads(query);
  }
}
