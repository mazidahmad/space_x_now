import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/result.dart';
import '../entities/rocket.dart';
import '../repositories/rocket_repository.dart';

class GetAllRockets implements UseCase<List<Rocket>, NoParams> {
  final RocketRepository repository;

  GetAllRockets(this.repository);

  @override
  Future<Result<List<Rocket>>> call(NoParams params) async {
    return await repository.getAllRockets();
  }
}
