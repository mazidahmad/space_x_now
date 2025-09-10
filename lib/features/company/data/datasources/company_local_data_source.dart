import 'package:injectable/injectable.dart';
import 'package:space_x_now/core/storages/cached_storage.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/company_model.dart';

abstract class CompanyLocalDataSource {
  Future<CompanyModel> getCachedCompanyInfo();
  Future<void> cacheCompanyInfo(CompanyModel companyToCache);
}

@Injectable(as: CompanyLocalDataSource)
class CompanyLocalDataSourceImpl implements CompanyLocalDataSource {
  final CachedStorage cachedStorage = getIt<CachedStorage>();

  @override
  Future<CompanyModel> getCachedCompanyInfo() async {
    final cached = await cachedStorage.read(CachedKeys.companyInfo);
    if (cached != null) {
      return CompanyModel.fromJson(cached);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCompanyInfo(CompanyModel companyToCache) {
    return cachedStorage.save(
      CachedKeys.companyInfo,
      companyToCache,
    );
  }
}
