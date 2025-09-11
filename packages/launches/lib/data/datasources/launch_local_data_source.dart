import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../models/launch_model.dart';

abstract class LaunchLocalDataSource {
  Future<List<LaunchModel>> getCachedLaunches();
  Future<void> cacheLaunches(List<LaunchModel> launches);
  Future<LaunchModel> getCachedLaunchById(String id);
  Future<void> cacheLaunch(LaunchModel launch);
  Future<LaunchModel?> getCachedLatestLaunch();
  Future<void> cacheLatestLaunch(LaunchModel launch);
  Future<LaunchModel?> getCachedNextLaunch();
  Future<void> cacheNextLaunch(LaunchModel launch);
  Future<void> clearCache();
}

@Injectable(as: LaunchLocalDataSource)
class LaunchLocalDataSourceImpl extends LaunchLocalDataSource {
  final CachedStorage cachedStorage = getIt<CachedStorage>();

  @override
  Future<List<LaunchModel>> getCachedLaunches() async {
    final jsonData = await cachedStorage.read(CachedKeys.launches);
    if (jsonData != null) {
      return (jsonData as List).map((e) => LaunchModel.fromJson(e)).toList();
    } else {
      throw const CacheException();
    }
  }

  @override
  Future<void> cacheLaunches(List<LaunchModel> launches) async {
    var jsonData = launches.map((e) => e.toJson()).toList();
    await cachedStorage.save(CachedKeys.launches, jsonData);
  }

  @override
  Future<LaunchModel> getCachedLaunchById(String id) async {
    final cachedLaunches = await getCachedLaunches();
    final launch = cachedLaunches.firstWhere(
      (launch) => launch.id == id,
      orElse: () => throw const CacheException(),
    );
    return launch;
  }

  @override
  Future<void> cacheLaunch(LaunchModel launch) async {
    try {
      final cachedLaunches = await getCachedLaunches();
      final index = cachedLaunches.indexWhere((l) => l.id == launch.id);
      if (index != -1) {
        cachedLaunches[index] = launch;
      } else {
        cachedLaunches.add(launch);
      }
      await cacheLaunches(cachedLaunches);
    } catch (e) {
      // If no cached launches exist, create a new list
      await cacheLaunches([launch]);
    }
  }

  @override
  Future<LaunchModel?> getCachedLatestLaunch() async {
    final cached =
        await cachedStorage.read<LaunchModel>(CachedKeys.latestLaunch);
    return cached;
  }

  @override
  Future<void> cacheLatestLaunch(LaunchModel launch) async {
    await cachedStorage.save<LaunchModel>(CachedKeys.latestLaunch, launch);
  }

  @override
  Future<LaunchModel?> getCachedNextLaunch() async {
    final cached = await cachedStorage.read<LaunchModel>(CachedKeys.nextLaunch);
    return cached;
  }

  @override
  Future<void> cacheNextLaunch(LaunchModel launch) async {
    await cachedStorage.save<LaunchModel>(CachedKeys.nextLaunch, launch);
  }

  @override
  Future<void> clearCache() async {
    await cachedStorage.delete(CachedKeys.launches);
    await cachedStorage.delete(CachedKeys.latestLaunch);
    await cachedStorage.delete(CachedKeys.nextLaunch);
  }
}
