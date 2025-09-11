import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../../domain/entities/launchpad.dart';
import '../../domain/repositories/launchpad_repository.dart';
import '../datasources/launchpad_local_data_source.dart';
import '../datasources/launchpad_remote_data_source.dart';

@Injectable(as: LaunchPadRepository)
class LaunchPadRepositoryImpl extends LaunchPadRepository with RepositoryMixin {
  final LaunchPadRemoteDataSource remoteDataSource =
      getIt<LaunchPadRemoteDataSource>();
  final LaunchPadLocalDataSource localDataSource =
      getIt<LaunchPadLocalDataSource>();
  final NetworkInfo networkInfo = getIt<NetworkInfo>();

  @override
  Future<Either<Failure, List<LaunchPad>>> getAllLaunchPads() => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final remoteLaunchPads = await remoteDataSource.getAllLaunchPads();
            await localDataSource.cacheLaunchPads(remoteLaunchPads);
            return remoteLaunchPads;
          } else {
            try {
              final localLaunchPads =
                  await localDataSource.getCachedLaunchPads();
              return localLaunchPads;
            } catch (e) {
              throw NetworkException();
            }
          }
        },
      );

  @override
  Future<Either<Failure, LaunchPad>> getLaunchPadById(String id) =>
      callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final remoteLaunchPad = await remoteDataSource.getLaunchPadById(id);
            await localDataSource.cacheLaunchPad(remoteLaunchPad);
            return remoteLaunchPad;
          } else {
            try {
              final localLaunchPad =
                  await localDataSource.getCachedLaunchPadById(id);
              return localLaunchPad;
            } catch (e) {
              throw NetworkException();
            }
          }
        },
      );

  @override
  Future<Either<Failure, List<LaunchPad>>> queryLaunchPads(
          Map<String, dynamic> query) =>
      callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final remoteLaunchPads =
                await remoteDataSource.queryLaunchPads(query);
            await localDataSource.cacheLaunchPads(remoteLaunchPads);
            return remoteLaunchPads;
          } else {
            try {
              final localLaunchPads =
                  await localDataSource.getCachedLaunchPads();
              return localLaunchPads;
            } catch (e) {
              throw NetworkException();
            }
          }
        },
      );
}
