class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

class NetworkException implements Exception {
  const NetworkException();
}

class CacheException implements Exception {
  const CacheException();
}

class ClientException implements Exception {
  final String errMessage;
  const ClientException({this.errMessage = "Client Error"});
}

class RequestException implements Exception {
  final String errMessage;
  const RequestException({this.errMessage = "Request Error"});
}

class UnauthorizedException implements Exception {
  final String errMessage;
  const UnauthorizedException({this.errMessage = "Unauthorized Error"});
}

class NotFoundException implements Exception {
  final String errMessage;
  const NotFoundException({this.errMessage = "Not Found Error"});
}
