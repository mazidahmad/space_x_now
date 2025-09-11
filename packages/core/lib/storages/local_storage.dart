import 'package:hive_ce_flutter/hive_flutter.dart';
import 'storage.dart';

class StorageKeys {
  // Launches
  static const String favorites = 'favorites';
  static const String locale = 'locale';
}

class LocalStorage extends Storage {
  late final Box _box;

  Future<void> init() async {
    _box = await Hive.openBox('local_storage');
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
