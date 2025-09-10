import 'package:injectable/injectable.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/result.dart';
import '../entities/crew_member.dart';
import '../repositories/crew_repository.dart';

@Injectable()
class QueryCrew implements UseCase<List<CrewMember>, Map<String, dynamic>> {
  final CrewRepository _repo = getIt<CrewRepository>();

  @override
  Future<Result<List<CrewMember>>> call(Map<String, dynamic> params) async {
    return await _repo.queryCrew(params);
  }
}
