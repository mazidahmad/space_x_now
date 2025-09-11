import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_core/entities/query_response.dart';
import 'package:space_x_now_di/di.dart';

import '../../domain/entities/rocket.dart';
import '../../domain/repositories/rocket_repository.dart';
import '../datasources/rocket_remote_data_source.dart';

@Injectable(as: RocketRepository)
class RocketRepositoryImpl extends RocketRepository with RepositoryMixin {
  final RocketRemoteDataSource remoteDataSource =
      getIt<RocketRemoteDataSource>();
  final NetworkInfo networkInfo = getIt<NetworkInfo>();

  @override
  Future<Either<Failure, List<Rocket>>> getAllRockets() => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final rockets = await remoteDataSource.getAllRockets();
            return rockets;
          } else {
            throw NetworkException();
          }
        },
      );

  @override
  Future<Either<Failure, Rocket>> getRocketById(String id) {
    return callDataSource(
      () async {
        if (await networkInfo.isConnected) {
          final rocket = await remoteDataSource.getRocketById(id);
          return rocket;
        } else {
          throw NetworkException();
        }
      },
    );
  }

  @override
  Future<Either<Failure, QueryResponse<Rocket>>> queryRockets(
          Map<String, dynamic> query) =>
      callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final rockets = await remoteDataSource.queryRockets(query);
            return rockets;
          } else {
            throw NetworkException();
          }
        },
      );
}
