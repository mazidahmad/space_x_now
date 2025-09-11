import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../models/payload_model.dart';

abstract class PayloadRemoteDataSource {
  Future<List<PayloadModel>> getAllPayloads();
  Future<PayloadModel> getPayloadById(String id);
  Future<List<PayloadModel>> queryPayloads(Map<String, dynamic> query);
}

@Injectable(as: PayloadRemoteDataSource)
class PayloadRemoteDataSourceImpl implements PayloadRemoteDataSource {
  final HttpModule client = getIt<HttpModule>();

  @override
  Future<List<PayloadModel>> getAllPayloads() async {
    final response = await client.get(ApiUrl.payloadsV4);

    if (response.data is List) {
      return (response.data as List)
          .map((json) => PayloadModel.fromJson(json))
          .toList();
    } else {
      throw ServerException('Failed to fetch payloads: ${response.status}');
    }
  }

  @override
  Future<PayloadModel> getPayloadById(String id) async {
    final response = await client.get(ApiUrl.payloadsV4 + '/$id');
    return PayloadModel.fromJson(response.data);
  }

  @override
  Future<List<PayloadModel>> queryPayloads(Map<String, dynamic> query) async {
    final response = await client.sendPostRequest(
      ApiUrl.payloadsV4,
      data: query,
    );

    if (response.data is List) {
      return (response.data as List)
          .map((json) => PayloadModel.fromJson(json))
          .toList();
    } else {
      throw ServerException('Failed to query payloads: ${response.status}');
    }
  }
}
