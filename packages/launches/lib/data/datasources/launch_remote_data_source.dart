import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_core/models/query_response_model.dart';
import 'package:space_x_now_di/di.dart';

import '../models/launch_model.dart';

abstract class LaunchRemoteDataSource {
  Future<List<LaunchModel>> getAllLaunches();
  Future<LaunchModel> getLaunchById(String id);
  Future<LaunchModel> getLatestLaunch();
  Future<LaunchModel> getNextLaunch();
  Future<List<LaunchModel>> getPastLaunches();
  Future<List<LaunchModel>> getUpcomingLaunches();
  Future<QueryResponseModel<LaunchModel>> queryLaunches(
      Map<String, dynamic> query);
}

@Injectable(as: LaunchRemoteDataSource)
class LaunchRemoteDataSourceImpl implements LaunchRemoteDataSource {
  final HttpModule client = getIt<HttpModule>();

  @override
  Future<List<LaunchModel>> getAllLaunches() async {
    final response = await client.get(ApiUrl.launchesV4);

    if (response.data is List) {
      return (response.data as List)
          .map((json) => LaunchModel.fromJson(json))
          .toList();
    } else {
      throw ServerException('Failed to get launches: Invalid response format');
    }
  }

  @override
  Future<LaunchModel> getLaunchById(String id) async {
    final response = await client.get('${ApiUrl.launchesV4}/$id');
    return LaunchModel.fromJson(response.data);
  }

  @override
  Future<LaunchModel> getLatestLaunch() async {
    final response = await client.get(
      ApiUrl.launchesV4Latest,
    );
    return LaunchModel.fromJson(response.data);
  }

  @override
  Future<LaunchModel> getNextLaunch() async {
    final response = await client.get(
      ApiUrl.launchesV4Next,
    );
    return LaunchModel.fromJson(response.data);
  }

  @override
  Future<List<LaunchModel>> getPastLaunches() async {
    final response = await client.get(
      ApiUrl.launchesV4Past,
    );

    if (response.data is List) {
      return (response.data as List)
          .map((json) => LaunchModel.fromJson(json))
          .toList();
    } else {
      throw ServerException(
        'Failed to get past launches: Invalid response format',
      );
    }
  }

  @override
  Future<List<LaunchModel>> getUpcomingLaunches() async {
    final response = await client.get(
      ApiUrl.launchesV4Upcoming,
    );

    if (response.data is List) {
      return (response.data as List)
          .map((json) => LaunchModel.fromJson(json))
          .toList();
    } else {
      throw ServerException(
          'Failed to get upcoming launches: Invalid response format');
    }
  }

  @override
  Future<QueryResponseModel<LaunchModel>> queryLaunches(
      Map<String, dynamic> query) async {
    final response = await client.sendPostRequest(
      ApiUrl.launchesV4Query,
      data: query,
    );
    return QueryResponseModel<LaunchModel>.fromJson(
      response.data,
      (json) => LaunchModel.fromJson(json),
    );
  }
}
