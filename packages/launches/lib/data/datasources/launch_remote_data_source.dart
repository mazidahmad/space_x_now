import 'dart:convert';
import 'package:space_x_now_core/core.dart';

import '../models/launch_model.dart';

abstract class LaunchRemoteDataSource {
  Future<List<LaunchModel>> getAllLaunches();
  Future<LaunchModel> getLaunchById(String id);
  Future<LaunchModel> getLatestLaunch();
  Future<LaunchModel> getNextLaunch();
  Future<List<LaunchModel>> getPastLaunches();
  Future<List<LaunchModel>> getUpcomingLaunches();
  Future<List<LaunchModel>> queryLaunches(Map<String, dynamic> query);
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
  Future<List<LaunchModel>> queryLaunches(Map<String, dynamic> query) async {
    final response = await client.sendPostRequest(
      ApiUrl.launchesV4Query,
      data: json.encode(query),
    );

    // Handle paginated response
    if (response.data is Map<String, dynamic> &&
        response.data.containsKey('docs')) {
      final List<dynamic> jsonList = response.data['docs'];
      return jsonList.map((json) => LaunchModel.fromJson(json)).toList();
    } else if (response.data is List<dynamic>) {
      return response.data.map((json) => LaunchModel.fromJson(json)).toList();
    } else {
      throw ServerException('Unexpected response format');
    }
  }
}
