import '../../../../core/di/service_locator.dart';
import '../../../../core/mixin/repository_mixin.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/company.dart';
import '../../domain/repositories/company_repository.dart';
import '../datasources/company_local_data_source.dart';
import '../datasources/company_remote_data_source.dart';

class CompanyRepositoryImpl extends CompanyRepository with RepositoryMixin {
  final CompanyRemoteDataSource remoteDataSource =
      getIt<CompanyRemoteDataSource>();
  final CompanyLocalDataSource localDataSource =
      getIt<CompanyLocalDataSource>();
  final NetworkInfo networkInfo = getIt<NetworkInfo>();

  @override
  Future<Result<Company>> getCompanyInfo() => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final company = await remoteDataSource.getCompanyInfo();
            localDataSource.cacheCompanyInfo(company);
            return company;
          } else {
            final cachedCompany = await localDataSource.getCachedCompanyInfo();
            return cachedCompany;
          }
        },
      );
}
