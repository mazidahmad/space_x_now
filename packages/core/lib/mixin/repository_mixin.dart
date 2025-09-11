import 'dart:developer';

import 'package:space_x_now_core/core.dart';

mixin RepositoryMixin {
  Future<Either<Failure, T>> callDataSource<T>(
      Future<T> Function() call) async {
    try {
      return Right(await call());
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      if (e is ServerException) {
        return Left(ServerFailure(e.message));
      } else if (e is NetworkException) {
        return const Left(NetworkFailure());
      } else if (e is ClientException) {
        return Left(ClientFailure(e.errMessage));
      } else {
        return Left(UnknownFailure(AppStrings.generalErrorMessage));
      }
    }
  }
}
