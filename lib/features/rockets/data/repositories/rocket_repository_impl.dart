import 'package:injectable/injectable.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/mixin/repository_mixin.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/rocket.dart';
import '../../domain/repositories/rocket_repository.dart';
import '../datasources/rocket_remote_data_source.dart';

@Injectable(as: RocketRepository)
class RocketRepositoryImpl extends RocketRepository with RepositoryMixin {
  final RocketRemoteDataSource remoteDataSource =
      getIt<RocketRemoteDataSource>();
  final NetworkInfo networkInfo = getIt<NetworkInfo>();

  @override
  Future<Result<List<Rocket>>> getAllRockets() => callDataSource(
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
  Future<Result<Rocket>> getRocketById(String id) {
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
  Future<Result<List<Rocket>>> queryRockets(Map<String, dynamic> query) =>
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
