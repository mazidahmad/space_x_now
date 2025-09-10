import 'package:injectable/injectable.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/result.dart';
import '../entities/company.dart';
import '../repositories/company_repository.dart';

@Injectable()
class GetCompanyInfo {
  final CompanyRepository _repo = getIt<CompanyRepository>();

  Future<Result<Company>> call() async {
    return await _repo.getCompanyInfo();
  }
}
