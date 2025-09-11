import 'package:space_x_now_core/storages/local_storage.dart';
import 'package:space_x_now_di/di.dart';

abstract class SettingsLocalDataSource {
  Future<String> getLocale();
  Future<void> setLocale(String locale);
}

@Injectable(as: SettingsLocalDataSource)
class SettingsLocalDataSourceImpl extends SettingsLocalDataSource {
  final LocalStorage _localStorage = getIt<LocalStorage>();

  @override
  Future<String> getLocale() async {
    return await _localStorage.read(StorageKeys.locale) ?? 'en';
  }

  @override
  Future<void> setLocale(String locale) {
    return _localStorage.save(StorageKeys.locale, locale);
  }
}
