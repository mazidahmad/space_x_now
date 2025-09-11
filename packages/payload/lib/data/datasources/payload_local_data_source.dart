import 'dart:convert';

import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../models/payload_model.dart';

abstract class PayloadLocalDataSource {
  Future<List<PayloadModel>> getCachedPayloads();
  Future<void> cachePayloads(List<PayloadModel> payloads);
  Future<PayloadModel> getCachedPayloadById(String id);
  Future<void> cachePayload(PayloadModel payload);
  Future<void> clearCache();
}

@Injectable(as: PayloadLocalDataSource)
class PayloadLocalDataSourceImpl implements PayloadLocalDataSource {
  final CachedStorage cachedStorage = getIt<CachedStorage>();

  @override
  Future<List<PayloadModel>> getCachedPayloads() async {
    final jsonString = await cachedStorage.read(CachedKeys.payloads);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => PayloadModel.fromJson(json)).toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cachePayloads(List<PayloadModel> payloads) async {
    final jsonString = json.encode(payloads.map((p) => p.toJson()).toList());
    await cachedStorage.save(CachedKeys.payloads, jsonString);
  }

  @override
  Future<PayloadModel> getCachedPayloadById(String id) async {
    final jsonString = await cachedStorage.read(CachedKeys.payloads + id);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return PayloadModel.fromJson(jsonMap);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cachePayload(PayloadModel payload) async {
    final jsonString = json.encode(payload.toJson());
    await cachedStorage.save(CachedKeys.payloads + payload.id, jsonString);
  }

  @override
  Future<void> clearCache() async {
    await cachedStorage.clear();
  }
}
