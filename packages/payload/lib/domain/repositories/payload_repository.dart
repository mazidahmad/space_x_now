import 'package:space_x_now_core/core.dart';

import '../entities/payload.dart';

abstract class PayloadRepository {
  Future<Either<Failure, List<Payload>>> getAllPayloads();
  Future<Either<Failure, Payload>> getPayloadById(String id);
  Future<Either<Failure, List<Payload>>> queryPayloads(
      Map<String, dynamic> query);
}
