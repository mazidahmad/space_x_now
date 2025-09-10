import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../models/rocket_model.dart';

abstract class RocketRemoteDataSource {
  Future<List<RocketModel>> getAllRockets();
  Future<RocketModel> getRocketById(String id);
  Future<List<RocketModel>> queryRockets(Map<String, dynamic> query);
}

@Injectable(as: RocketRemoteDataSource)
class RocketRemoteDataSourceImpl implements RocketRemoteDataSource {
  final HttpModule client = getIt<HttpModule>();

  @override
  Future<List<RocketModel>> getAllRockets() async {
    final response = await client.get(ApiUrl.rocketsV4);

    if (response.data is List) {
      return (response.data as List)
          .map((json) => RocketModel.fromJson(json))
          .toList();
    } else {
      throw ServerException('Failed to get rockets: Invalid response format');
    }
  }

  @override
  Future<RocketModel> getRocketById(String id) async {
    final response = await client.get('${ApiUrl.rocketsV4}/$id');
    return RocketModel.fromJson(response.data);
  }

  @override
  Future<List<RocketModel>> queryRockets(Map<String, dynamic> query) async {
    final response = await client.sendPostRequest(
      ApiUrl.rocketsV4Query,
      data: query,
    );

    if (response.data is List) {
      return (response.data as List)
          .map((json) => RocketModel.fromJson(json))
          .toList();
    } else if (response.data is Map<String, dynamic>) {
      return [RocketModel.fromJson(response.data)];
    } else {
      throw ServerException('Failed to query rockets: ${response.code}');
    }
  }
}
