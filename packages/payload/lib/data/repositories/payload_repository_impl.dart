import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../../domain/entities/payload.dart';
import '../../domain/repositories/payload_repository.dart';
import '../datasources/payload_local_data_source.dart';
import '../datasources/payload_remote_data_source.dart';

@Injectable(as: PayloadRepository)
class PayloadRepositoryImpl extends PayloadRepository with RepositoryMixin {
  final PayloadRemoteDataSource remoteDataSource =
      getIt<PayloadRemoteDataSource>();
  final PayloadLocalDataSource localDataSource =
      getIt<PayloadLocalDataSource>();
  final NetworkInfo networkInfo = getIt<NetworkInfo>();

  @override
  Future<Either<Failure, List<Payload>>> getAllPayloads() => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final remotePayloads = await remoteDataSource.getAllPayloads();
            await localDataSource.cachePayloads(remotePayloads);
            return remotePayloads;
          } else {
            try {
              final localPayloads = await localDataSource.getCachedPayloads();
              return localPayloads;
            } catch (e) {
              throw NetworkException();
            }
          }
        },
      );

  @override
  Future<Either<Failure, Payload>> getPayloadById(String id) => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final remotePayload = await remoteDataSource.getPayloadById(id);
            await localDataSource.cachePayload(remotePayload);
            return remotePayload;
          } else {
            try {
              final localPayload =
                  await localDataSource.getCachedPayloadById(id);
              return localPayload;
            } catch (e) {
              throw NetworkException();
            }
          }
        },
      );

  @override
  Future<Either<Failure, List<Payload>>> queryPayloads(
          Map<String, dynamic> query) =>
      callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final queryResults = await remoteDataSource.queryPayloads(query);
            return queryResults;
          } else {
            throw NetworkException();
          }
        },
      );
}
