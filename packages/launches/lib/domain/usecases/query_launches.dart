import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_core/entities/query_response.dart';
import 'package:space_x_now_di/di.dart';

import '../entities/launch.dart';
import '../repositories/launch_repository.dart';

@Injectable()
class QueryLaunches
    implements UseCase<QueryResponse<Launch>, Map<String, dynamic>> {
  final LaunchRepository repository;

  QueryLaunches(this.repository);

  @override
  Future<Either<Failure, QueryResponse<Launch>>> call(
      Map<String, dynamic> params) async {
    return await repository.queryLaunches(params);
  }
}
