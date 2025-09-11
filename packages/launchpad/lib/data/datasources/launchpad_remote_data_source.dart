import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../models/launchpad_model.dart';

abstract class LaunchPadRemoteDataSource {
  Future<List<LaunchPadModel>> getAllLaunchPads();
  Future<LaunchPadModel> getLaunchPadById(String id);
  Future<List<LaunchPadModel>> queryLaunchPads(Map<String, dynamic> query);
}

@Injectable(as: LaunchPadRemoteDataSource)
class LaunchPadRemoteDataSourceImpl implements LaunchPadRemoteDataSource {
  final HttpModule client = getIt<HttpModule>();

  @override
  Future<List<LaunchPadModel>> getAllLaunchPads() async {
    final response = await client.get(ApiUrl.launchpadsV4);

    if (response.data is List) {
      return (response.data as List)
          .map((json) => LaunchPadModel.fromJson(json))
          .toList();
    } else {
      throw ServerException('Failed to fetch launchpads: ${response.status}');
    }
  }

  @override
  Future<LaunchPadModel> getLaunchPadById(String id) async {
    final response = await client.get('${ApiUrl.launchpadsV4}/$id');
    return LaunchPadModel.fromJson(response.data);
  }

  @override
  Future<List<LaunchPadModel>> queryLaunchPads(
      Map<String, dynamic> query) async {
    final response = await client.sendPostRequest(
      ApiUrl.launchpadsV4,
      data: query,
    );

    if (response.data is List) {
      return (response.data as List)
          .map((json) => LaunchPadModel.fromJson(json))
          .toList();
    } else {
      throw ServerException('Failed to query launchpads: ${response.status}');
    }
  }
}
