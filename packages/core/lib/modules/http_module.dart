import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/app_strings.dart';
import '../errors/exceptions.dart';

import 'networks/interceptors/logging_interceptor.dart';
import 'networks/response.dart';

class HttpModule {
  late Dio _client;

  HttpModule({String baseUrl = ''}) {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    _client = Dio(baseOptions);

    _client.interceptors.addAll(
      [
        LoggingInterceptor(),
      ],
    );
  }

  Future<ResponseParser<dynamic>> _callAdapter(
      Future<Response<dynamic>> method) async {
    try {
      var result = await method;

      if (result.data is List<int>) {
        return ResponseParser(
          code: result.statusCode ?? 0,
          status: ResponseStatus.success,
          data: result.data,
          message: AppStrings.successString,
        );
      }

      var code = result.statusCode;
      var message = result.data['message'];
      var data = result.data['data'] ?? result.data;

      if (data is! bool && data['data'] is! List) {
        data = data['data'] ?? data;
      }

      if (code == null) {
        throw ClientException(errMessage: message);
      } else if (code >= 400 && code < 500) {
        if (data is List) {
          throw RequestException(
            errMessage: data.firstOrNull ?? AppStrings.generalErrorMessage,
          );
        }
        throw RequestException(errMessage: message);
      } else if (code >= 500) {
        throw ServerException(message);
      }

      return ResponseParser(
          code: result.statusCode ?? code,
          status: ResponseStatus.success,
          data: data,
          message: result.statusMessage ?? message ?? AppStrings.successString);
    } on DioException catch (err) {
      String message = AppStrings.generalErrorMessage;
      try {
        if (err.response?.data is Map) {
          String? errorMessage = err.response?.data['message'];
          if (errorMessage != null) {
            if (errorMessage.length < 200) {
              message = errorMessage;
            }
          } else {
            message = err.response?.statusMessage ?? message;
          }
        }
      } catch (_) {}

      int? errCode = err.response?.statusCode;

      List<DioExceptionType> dioTimeout = [
        DioExceptionType.sendTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.connectionTimeout,
      ];

      if (dioTimeout.any((e) => err.type == e)) {
        throw NetworkException();
      }

      if (errCode == null) {
        throw ClientException(errMessage: message);
      } else if (errCode >= 400 && errCode < 500) {
        if (errCode == 401) {
          throw const UnauthorizedException();
        }
        if (errCode == 404) {
          throw const NotFoundException();
        }
        throw RequestException(errMessage: message);
      } else if (errCode >= 500) {
        throw ServerException(message);
      } else {
        throw ClientException(errMessage: message);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseParser<dynamic>> sendPostRequest(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
    void Function(int, int)? onSendProgress,
  }) async {
    var response = await _callAdapter(
      _client.post(
        path,
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
        onSendProgress: onSendProgress,
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendPatchRequest(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
    void Function(int, int)? onSendProgress,
  }) async {
    var response = await _callAdapter(
      _client.patch(
        path,
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
        onSendProgress: onSendProgress,
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendGetRequest(
    String path, {
    Map<String, dynamic>? headers,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    var response = await _callAdapter(
      _client.get(
        path,
        onReceiveProgress: onReceiveProgress,
        options: options ?? Options(headers: headers),
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendPutRequest(
    String path, {
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    var response = await _callAdapter(
      _client.put(
        path,
        data: data,
        options: Options(headers: headers),
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendDeleteRequest(
    String path, {
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    var response = await _callAdapter(
      _client.delete(
        path,
        data: data,
        options: Options(headers: headers),
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> get(
    String path, {
    Map<String, dynamic>? headers,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    var response = await _callAdapter(_client.get(
      path,
      onReceiveProgress: onReceiveProgress,
      options: options ?? Options(headers: headers),
    ));

    return response;
  }

  Future<Response<dynamic>> download(
      {required String urlPath,
      required String savePath,
      void Function(int, int)? onReceiveProgress}) {
    return _client.download(
      urlPath,
      savePath,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> retryRequest(RequestOptions options) async {
    try {
      final response = await _client.request(
        options.path,
        data: options.data,
        queryParameters: options.queryParameters,
        options: Options(
          method: options.method,
          headers: _client.options.headers,
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadFile({required dynamic data}) async {
    try {
      final response = await _client.post(
        '/upload',
        data: FormData.fromMap(data),
      );
      if (response.statusCode == 200) {
        log('File uploaded successfully: ${response.data}');
        return response.data['fileUrl'] ?? '';
      } else {
        log('Failed to upload file: ${response.statusMessage}');
        throw Exception('Failed to upload file');
      }
    } catch (e) {
      log('Error uploading file: $e');
      throw Exception('Failed to upload file');
    }
  }
}
