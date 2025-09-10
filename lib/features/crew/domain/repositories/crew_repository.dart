import '../../../../core/utils/result.dart';
import '../entities/crew_member.dart';

abstract class CrewRepository {
  Future<Result<List<CrewMember>>> getAllCrew();
  Future<Result<CrewMember>> getCrewById(String id);
  Future<Result<List<CrewMember>>> queryCrew(Map<String, dynamic> query);
}
