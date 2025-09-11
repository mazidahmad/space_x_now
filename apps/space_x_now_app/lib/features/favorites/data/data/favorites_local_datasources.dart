import 'dart:convert';

import 'package:space_x_now_core/storages/local_storage.dart';
import 'package:space_x_now_di/di.dart';
import 'package:space_x_rockets/data/models/rocket_model.dart';

abstract class FavoritesLocalDataSource {
  Future<void> saveFavoritedRocket(RocketModel rocket);
  Future<void> removeFavoritedRocket(String rocketId);
  Future<List<RocketModel>> getFavoritedRockets();
  Future<bool> isRocketFavorited(String rocketId) async {
    var favorited = await getFavoritedRockets();
    return favorited.any((rocket) => rocket.id == rocketId);
  }
}

@Injectable(as: FavoritesLocalDataSource)
class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final LocalStorage _localStorage = getIt<LocalStorage>();

  @override
  Future<void> saveFavoritedRocket(RocketModel rocket) async {
    var favorited = await getFavoritedRockets();
    favorited.add(rocket);
    var jsonData = jsonEncode(favorited.map((e) => e.toJson()).toList());
    await _localStorage.save(StorageKeys.favorites, jsonData);
  }

  @override
  Future<List<RocketModel>> getFavoritedRockets() async {
    var jsonData = await _localStorage.read(StorageKeys.favorites);
    if (jsonData == null) return [];

    var data = jsonDecode(jsonData);
    return List<RocketModel>.from(
      data.map((item) => RocketModel.fromJson(item)),
    );
  }

  @override
  Future<void> removeFavoritedRocket(String rocketId) {
    return getFavoritedRockets().then((favorited) async {
      favorited.removeWhere((rocket) => rocket.id == rocketId);
      var jsonData = jsonEncode(favorited.map((e) => e.toJson()).toList());
      await _localStorage.save(StorageKeys.favorites, jsonData);
    });
  }

  @override
  Future<bool> isRocketFavorited(String rocketId) {
    return getFavoritedRockets().then((favorited) {
      return favorited.any((rocket) => rocket.id == rocketId);
    });
  }
}
