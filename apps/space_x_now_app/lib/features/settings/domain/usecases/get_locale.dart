import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../repositories/settings_repository.dart';

@Injectable()
class GetLocale extends UseCase<String, NoParams> {
  final SettingsRepository _repo = getIt<SettingsRepository>();

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return _repo.getLocale();
  }
}
