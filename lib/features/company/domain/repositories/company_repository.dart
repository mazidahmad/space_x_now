import '../../../../core/utils/result.dart';
import '../entities/company.dart';

abstract class CompanyRepository {
  Future<Result<Company>> getCompanyInfo();
}
