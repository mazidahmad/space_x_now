import 'package:space_x_now_core/core.dart';

abstract class SettingsRepository {
  Future<Either<Failure, String>> getLocale();
  Future<Either<Failure, void>> setLocale(String locale);
}
