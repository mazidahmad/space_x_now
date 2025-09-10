abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('Network failure');
}

class ClientFailure extends Failure {
  const ClientFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure() : super('Cache failure');
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

class FailureWithMessage extends Failure {
  const FailureWithMessage(super.message);
}
