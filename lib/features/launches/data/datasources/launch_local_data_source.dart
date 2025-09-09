import 'package:injectable/injectable.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/storages/cached_storage.dart';
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

  static const String cachedLaunchesKey = 'CACHED_LAUNCHES';
  static const String cachedLatestLaunchKey = 'CACHED_LATEST_LAUNCH';
  static const String cachedNextLaunchKey = 'CACHED_NEXT_LAUNCH';

  @override
  Future<List<LaunchModel>> getCachedLaunches() async {
    final cached =
        await cachedStorage.read<List<LaunchModel>>(CachedKeys.launches);
    if (cached != null) {
      return cached;
    } else {
      throw const CacheException();
    }
  }

  @override
  Future<void> cacheLaunches(List<LaunchModel> launches) async {
    await cachedStorage.save<List<LaunchModel>>(CachedKeys.launches, launches);
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
