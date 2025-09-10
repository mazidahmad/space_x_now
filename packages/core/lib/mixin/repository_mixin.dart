import 'dart:developer';

import '../constants/app_strings.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';
import '../utils/result.dart';

mixin RepositoryMixin {
  Future<Result<T>> callDataSource<T>(Future<T> Function() call) async {
    try {
      return Success(await call());
    } catch (e) {
      log(e.toString());
      if (e is ServerException) {
        return Error(ServerFailure(e.message));
      } else if (e is NetworkException) {
        return const Error(NetworkFailure());
      } else if (e is ClientException) {
        return Error(ClientFailure(e.errMessage));
      } else {
        return Error(UnknownFailure(AppStrings.generalErrorMessage));
      }
    }
  }
}
