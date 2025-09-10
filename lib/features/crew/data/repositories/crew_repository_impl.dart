import 'package:injectable/injectable.dart';
import 'package:space_x_now/core/errors/exceptions.dart';
import 'package:space_x_now/core/mixin/repository_mixin.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/crew_member.dart';
import '../../domain/repositories/crew_repository.dart';
import '../datasources/crew_remote_data_source.dart';

@Injectable(as: CrewRepository)
class CrewRepositoryImpl extends CrewRepository with RepositoryMixin {
  final CrewRemoteDataSource remoteDataSource = getIt<CrewRemoteDataSource>();
  final NetworkInfo networkInfo = getIt<NetworkInfo>();

  @override
  Future<Result<List<CrewMember>>> getAllCrew() => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final crew = await remoteDataSource.getAllCrew();
            return crew;
          } else {
            throw NetworkException();
          }
        },
      );

  @override
  Future<Result<CrewMember>> getCrewById(String id) async => callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final crewMember = await remoteDataSource.getCrewById(id);
            return crewMember;
          } else {
            throw NetworkException();
          }
        },
      );

  @override
  Future<Result<List<CrewMember>>> queryCrew(Map<String, dynamic> query) =>
      callDataSource(
        () async {
          if (await networkInfo.isConnected) {
            final crew = await remoteDataSource.queryCrew(query);
            return crew;
          } else {
            throw NetworkException();
          }
        },
      );
}
