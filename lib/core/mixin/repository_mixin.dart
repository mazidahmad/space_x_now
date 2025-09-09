import 'dart:developer';

import '../errors/failures.dart';
import '../utils/result.dart';

mixin RepositoryMixin {
  Future<Result<T>> callDataSource<T>(Future<T> Function() call) async {
    try {
      return Success(await call());
    } catch (e) {
      log(e.toString());
      if (e is Failure) {
        return Error(e);
      } else {
        return Error(ClientFailure(e.toString()));
      }
    }
  }
}
