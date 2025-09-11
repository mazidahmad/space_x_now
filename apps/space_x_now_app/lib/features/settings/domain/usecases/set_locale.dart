import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../repositories/settings_repository.dart';

@Injectable()
class SetLocale extends UseCase<void, String> {
  final SettingsRepository _repo = getIt<SettingsRepository>();

  @override
  Future<Either<Failure, void>> call(String params) {
    return _repo.setLocale(params);
  }
}
