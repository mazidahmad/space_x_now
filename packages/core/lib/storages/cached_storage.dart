import 'package:hive_ce_flutter/hive_flutter.dart';
import 'storage.dart';

class CachedKeys {
  // Launches
  static const String launches = 'launches';
  static const String latestLaunch = 'latest_launch';
  static const String nextLaunch = 'next_launch';

  // Payloads
  static const String payloads = 'payloads';

  // Launchpad
  static const String launchpads = 'launchpads';

  // Rockets
  static const String rockets = 'rockets';
}

class BoxName {
  static const String appCache = 'app_cache';
}

class CachedStorage extends Storage {
  late final Box _box;

  Future<void> init(String boxName) async {
    _box = await Hive.openBox(boxName);
  }

  @override
  Future<void> save<T>(String key, T value) async {
    await _box.put(key, value);
  }

  @override
  Future<T?> read<T>(String key) async {
    return _box.get(key) as T?;
  }

  @override
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  Future<void> close() async {
    await _box.close();
  }
}
