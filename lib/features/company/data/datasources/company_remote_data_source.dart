import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_url.dart';
import '../../../../core/modules/http_module.dart';
import '../models/company_model.dart';

abstract class CompanyRemoteDataSource {
  Future<CompanyModel> getCompanyInfo();
}

@Injectable(as: CompanyRemoteDataSource)
class CompanyRemoteDataSourceImpl implements CompanyRemoteDataSource {
  final HttpModule client;

  CompanyRemoteDataSourceImpl({required this.client});

  @override
  Future<CompanyModel> getCompanyInfo() async {
    final response = await client.get(ApiUrl.companyV4);
    return CompanyModel.fromJson(response.data);
  }
}
