import 'package:flutter/material.dart';
import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';
import 'package:space_x_rockets/rockets.dart';

part 'rockets_state.dart';

@Injectable()
class RocketsCubit extends Cubit<RocketsState> {
  RocketsCubit() : super(RocketsState(params: {'query': {}, 'options': {}}));

  final QueryRockets _queryRockets = getIt<QueryRockets>();

  final ScrollController scrollController = ScrollController();

  void initialize() async {
    emit(state.copyWith(status: RocketsStatus.loading));

    final result = await _queryRockets.call(state.params);

    result.fold(
      (failure) => emit(state.copyWith(
        status: RocketsStatus.failure,
        failure: failure,
      )),
      (rockets) => emit(state.copyWith(
        status: RocketsStatus.success,
        rockets: rockets.docs,
      )),
    );
  }

  void searchRockets(String query) async {
    state.params['query']?.addAll({
      '\$text': {'\$search': query}
    });

    if (query.isEmpty) {
      state.params['query']?.remove('\$text');
    }

    emit(state.copyWith(
      status: RocketsStatus.loading,
    ));

    final result = await _queryRockets.call(state.params);

    result.fold(
      (failure) => emit(state.copyWith(
        status: RocketsStatus.failure,
        failure: failure,
      )),
      (rockets) => emit(state.copyWith(
        status: RocketsStatus.success,
        rockets: rockets.docs,
      )),
    );
  }

  void filterRockets(RocketsFilter status) async {
    if (status == RocketsFilter.all) {
      state.params['query']?.remove('active');
    } else if (status == RocketsFilter.active) {
      state.params['query'] = {...?state.params['query'], 'active': true};
    } else if (status == RocketsFilter.inactive) {
      state.params['query'] = {...?state.params['query'], 'active': false};
    }

    emit(state.copyWith(
      status: RocketsStatus.loading,
    ));

    final result = await _queryRockets.call(state.params);

    result.fold(
      (failure) => emit(state.copyWith(
        status: RocketsStatus.failure,
        failure: failure,
      )),
      (rockets) => emit(state.copyWith(
        status: RocketsStatus.success,
        rockets: rockets.docs,
      )),
    );
  }
}
