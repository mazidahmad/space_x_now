import 'package:injectable/injectable.dart';
import 'package:space_x_now/core/constants/api_url.dart';
import 'package:space_x_now/core/modules/http_module.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/crew_member_model.dart';

abstract class CrewRemoteDataSource {
  Future<List<CrewMemberModel>> getAllCrew();
  Future<CrewMemberModel> getCrewById(String id);
  Future<List<CrewMemberModel>> queryCrew(Map<String, dynamic> query);
}

@Injectable(as: CrewRemoteDataSource)
class CrewRemoteDataSourceImpl implements CrewRemoteDataSource {
  final HttpModule client = getIt<HttpModule>();

  @override
  Future<List<CrewMemberModel>> getAllCrew() async {
    final response = await client.get(ApiUrl.crewV4);

    if (response.data is List) {
      return (response.data as List)
          .map((json) => CrewMemberModel.fromJson(json))
          .toList();
    } else {
      throw ServerException('Failed to get crew: ${response.code}');
    }
  }

  @override
  Future<CrewMemberModel> getCrewById(String id) async {
    final response = await client.get('${ApiUrl.crewV4}/$id');

    if (response.data is Map<String, dynamic>) {
      return CrewMemberModel.fromJson(response.data);
    } else {
      throw ServerException('Failed to get crew member: ${response.code}');
    }
  }

  @override
  Future<List<CrewMemberModel>> queryCrew(Map<String, dynamic> query) async {
    final response = await client.sendPostRequest(
      ApiUrl.crewV4Query,
      data: query,
    );

    final data = response.data;

    // Handle paginated response
    if (data is Map<String, dynamic> && data.containsKey('docs')) {
      final List<dynamic> jsonList = data['docs'];
      return jsonList.map((json) => CrewMemberModel.fromJson(json)).toList();
    } else if (data is List<dynamic>) {
      return data.map((json) => CrewMemberModel.fromJson(json)).toList();
    } else {
      throw ServerException('Unexpected response format');
    }
  }
}
