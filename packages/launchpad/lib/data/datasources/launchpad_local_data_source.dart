import 'dart:convert';

import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../models/launchpad_model.dart';

abstract class LaunchPadLocalDataSource {
  Future<List<LaunchPadModel>> getCachedLaunchPads();
  Future<void> cacheLaunchPads(List<LaunchPadModel> launchpads);
  Future<LaunchPadModel> getCachedLaunchPadById(String id);
  Future<void> cacheLaunchPad(LaunchPadModel launchpad);
  Future<void> clearCache();
}

@Injectable(as: LaunchPadLocalDataSource)
class LaunchPadLocalDataSourceImpl implements LaunchPadLocalDataSource {
  final CachedStorage cachedStorage = getIt<CachedStorage>();

  @override
  Future<List<LaunchPadModel>> getCachedLaunchPads() async {
    final jsonString = await cachedStorage.read(CachedKeys.launchpads);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => LaunchPadModel.fromJson(json)).toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheLaunchPads(List<LaunchPadModel> launchpads) async {
    final jsonString = json.encode(launchpads.map((l) => l.toJson()).toList());
    await cachedStorage.save(CachedKeys.launchpads, jsonString);
  }

  @override
  Future<LaunchPadModel> getCachedLaunchPadById(String id) async {
    final jsonString = await cachedStorage.read('${CachedKeys.launchpads}/$id');
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return LaunchPadModel.fromJson(jsonMap);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheLaunchPad(LaunchPadModel launchpad) async {
    final jsonString = json.encode(launchpad.toJson());
    await cachedStorage.save('${CachedKeys.launchpads}/$id', jsonString);
  }

  @override
  Future<void> clearCache() async {
    await cachedStorage.clear();
  }
}
