import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../errors/exceptions.dart';
import '../errors/failure.dart';

mixin RepositoryMixin {
  Future<Either<Failure, T>> callDataSource<T>(
      Future<T> Function() call) async {
    try {
      return right(await call());
    } on ApiException catch (e) {
      return left(Failure<ApiException>(message: e.message, error: e));
    } catch (e, stackTrace) {
      log('log-error: ${e.toString()}', stackTrace: stackTrace);
      return left(Failure(message: e.toString()));
    }
  }
}
