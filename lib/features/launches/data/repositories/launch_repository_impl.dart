import 'package:space_x_now/core/errors/failures.dart';
import 'package:space_x_now/core/mixin/repository_mixin.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/launch.dart';
import '../../domain/repositories/launch_repository.dart';
import '../datasources/launch_local_data_source.dart';
import '../datasources/launch_remote_data_source.dart';

class LaunchRepositoryImpl extends LaunchRepository with RepositoryMixin {
  final LaunchRemoteDataSource remoteDataSource =
      getIt<LaunchRemoteDataSource>();
  final LaunchLocalDataSource localDataSource = getIt<LaunchLocalDataSource>();
  final networkInfo = getIt<NetworkInfo>();

  @override
  Future<Result<List<Launch>>> getAllLaunches() => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final launches = await remoteDataSource.getAllLaunches();
            await localDataSource.cacheLaunches(launches);
            return launches;
          } else {
            try {
              final launches = await localDataSource.getCachedLaunches();
              return launches;
            } catch (e) {
              rethrow;
            }
          }
        },
      );

  @override
  Future<Result<Launch>> getLaunchById(String id) => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final launch = await remoteDataSource.getLaunchById(id);
            await localDataSource.cacheLaunch(launch);
            return launch;
          } else {
            try {
              final launch = await localDataSource.getCachedLaunchById(id);
              return launch;
            } catch (e) {
              rethrow;
            }
          }
        },
      );

  @override
  Future<Result<Launch?>> getLatestLaunch() => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final launch = await remoteDataSource.getLatestLaunch();
            await localDataSource.cacheLaunch(launch);
            return launch;
          } else {
            try {
              final launch = await localDataSource.getCachedLatestLaunch();
              return launch;
            } catch (e) {
              rethrow;
            }
          }
        },
      );

  @override
  Future<Result<Launch?>> getNextLaunch() => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final launch = await remoteDataSource.getNextLaunch();
            await localDataSource.cacheLaunch(launch);
            return launch;
          } else {
            try {
              final launch = await localDataSource.getCachedNextLaunch();
              return launch;
            } catch (e) {
              rethrow;
            }
          }
        },
      );

  @override
  Future<Result<List<Launch>>> getPastLaunches() => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final launches = await remoteDataSource.getPastLaunches();
            await localDataSource.cacheLaunches(launches);
            return launches;
          } else {
            throw NetworkFailure();
          }
        },
      );

  @override
  Future<Result<List<Launch>>> getUpcomingLaunches() => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final launches = await remoteDataSource.getUpcomingLaunches();
            await localDataSource.cacheLaunches(launches);
            return launches;
          } else {
            throw NetworkFailure();
          }
        },
      );

  @override
  Future<Result<List<Launch>>> queryLaunches(Map<String, dynamic> query) =>
      callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final launches = await remoteDataSource.queryLaunches(query);
            return launches;
          } else {
            throw NetworkFailure();
          }
        },
      );
}
