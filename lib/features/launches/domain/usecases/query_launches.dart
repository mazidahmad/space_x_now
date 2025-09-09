import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/result.dart';
import '../entities/launch.dart';
import '../repositories/launch_repository.dart';

class QueryLaunches implements UseCase<List<Launch>, Map<String, dynamic>> {
  final LaunchRepository repository;

  QueryLaunches(this.repository);

  @override
  Future<Result<List<Launch>>> call(Map<String, dynamic> params) async {
    return await repository.queryLaunches(params);
  }
}
