abstract class Storage {
  Future<void> save<T>(String key, T value);
  Future<T?> read<T>(String key);
  Future<void> delete(String key);
  Future<void> clear();
}
