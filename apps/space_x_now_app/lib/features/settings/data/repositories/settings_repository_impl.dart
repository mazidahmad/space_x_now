import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_datasource.dart';

@Injectable(as: SettingsRepository)
class SettingsRepositoryImpl extends SettingsRepository with RepositoryMixin {
  final SettingsLocalDataSource _localDataSource =
      getIt<SettingsLocalDataSource>();
  @override
  Future<Either<Failure, String>> getLocale() => callDataSource(
        () => _localDataSource.getLocale(),
      );

  @override
  Future<Either<Failure, void>> setLocale(String locale) => callDataSource(
        () => _localDataSource.setLocale(locale),
      );
}
