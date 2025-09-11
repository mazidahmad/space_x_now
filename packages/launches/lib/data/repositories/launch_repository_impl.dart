import 'package:space_x_launchpad/data/datasources/launchpad_remote_data_source.dart';
import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_core/entities/query_response.dart';
import 'package:space_x_now_di/di.dart';
import 'package:space_x_payload/data/datasources/payload_remote_data_source.dart';
import 'package:space_x_rockets/data/datasources/rocket_remote_data_source.dart';

import '../../domain/entities/launch.dart';
import '../../domain/repositories/launch_repository.dart';
import '../datasources/launch_local_data_source.dart';
import '../datasources/launch_remote_data_source.dart';

@Injectable(as: LaunchRepository)
class LaunchRepositoryImpl extends LaunchRepository with RepositoryMixin {
  final LaunchRemoteDataSource remoteDataSource =
      getIt<LaunchRemoteDataSource>();
  final LaunchLocalDataSource localDataSource = getIt<LaunchLocalDataSource>();
  final RocketRemoteDataSource rocketRemoteDataSource =
      getIt<RocketRemoteDataSource>();
  final PayloadRemoteDataSource payloadRemoteDataSource =
      getIt<PayloadRemoteDataSource>();
  final LaunchPadRemoteDataSource launchPadRemoteDataSource =
      getIt<LaunchPadRemoteDataSource>();
  final networkInfo = getIt<NetworkInfo>();

  @override
  Future<Either<Failure, List<Launch>>> getAllLaunches() => callDataSource(
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
  Future<Either<Failure, Launch>> getLaunchById(String id) => callDataSource(
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
  Future<Either<Failure, Launch?>> getLatestLaunch() => callDataSource(
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
  Future<Either<Failure, Launch?>> getNextLaunch() => callDataSource(
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
  Future<Either<Failure, List<Launch>>> getPastLaunches() => callDataSource(
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
  Future<Either<Failure, List<Launch>>> getUpcomingLaunches() => callDataSource(
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
  Future<Either<Failure, QueryResponse<Launch>>> queryLaunches(
          Map<String, dynamic> query) =>
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
