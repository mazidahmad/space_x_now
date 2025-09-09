abstract class AppException implements Exception {
  final String message;
  final String errorMessage;

  const AppException({required this.message, required this.errorMessage});

  @override
  String toString() => message;
}

abstract class ApiException extends AppException {
  final int? statusCode;

  const ApiException(
      {this.statusCode, required super.message, String? errorMessage})
      : super(errorMessage: errorMessage ?? message);
}

class ClientException extends ApiException {
  final String? errMessage;

  const ClientException({this.errMessage})
      : super(
          message: errMessage ?? 'Client Error',
          statusCode: 0,
          errorMessage: errMessage,
        );
}

class ServerException extends ApiException {
  final String? errMessage;

  const ServerException({this.errMessage})
      : super(
          message:
              errMessage ?? 'Internal Server Error. Please try again later.',
          statusCode: 500,
          errorMessage: errMessage,
        );
}

class RequestTimeoutException extends ApiException {
  final String? errMessage;
  const RequestTimeoutException({this.errMessage})
      : super(
          message: errMessage ?? 'Request Timeout. Please try again later.',
          errorMessage: errMessage,
        );
}

class ConnectionTimeoutException extends ApiException {
  final String? errMessage;
  const ConnectionTimeoutException({this.errMessage})
      : super(
          message: errMessage ?? 'Connection Timeout. Please try again later.',
          errorMessage: errMessage,
        );
}

class NetworkException extends ApiException {
  final String? errMessage;
  const NetworkException({this.errMessage})
      : super(
          message: errMessage ?? 'Network Error. Please check your connection.',
          statusCode: 0,
          errorMessage: errMessage,
        );
}

class NotFoundException extends ApiException {
  final String? errMessage;

  const NotFoundException({this.errMessage})
      : super(
          message: errMessage ?? 'Resource not found',
          statusCode: 404,
          errorMessage: errMessage,
        );
}

class UnauthorizedException extends ApiException {
  final String? errMessage;
  const UnauthorizedException({this.errMessage})
      : super(
          message: errMessage ?? 'Unauthorized Request',
          statusCode: 401,
          errorMessage: errMessage,
        );
}

class RequestException extends ApiException {
  final String? errMessage;
  const RequestException({this.errMessage})
      : super(
          message:
              errMessage ?? 'An error occurred while processing your request',
          statusCode: 400,
          errorMessage: errMessage,
        );
}

class UnexpectedException extends ApiException {
  final String? errMessage;
  const UnexpectedException({this.errMessage})
      : super(
          message: errMessage ?? 'Unexpected error occurred. Please try again.',
          errorMessage: errMessage,
        );
}
