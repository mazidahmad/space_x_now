import 'package:flutter/material.dart';
import 'package:space_x_launches/launches.dart';
import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

part 'recent_launches_state.dart';

@Injectable()
class RecentLaunchesCubit extends Cubit<RecentLaunchesState> {
  RecentLaunchesCubit()
      : super(const RecentLaunchesState(params: {
          'query': {},
          'options': {
            'limit': 5,
            'page': 1,
            'pagination': true,
            'sort': {'date_utc': 'desc'},
            'populate': [
              'rocket',
              'launchpad',
            ],
          }
        }, launches: []));

  final QueryLaunches query = getIt<QueryLaunches>();

  final ScrollController scrollController = ScrollController();

  void fetchLaunches() async {
    if (state.status == RecentLaunchesStatus.loading) return;
    emit(state.copyWith(status: RecentLaunchesStatus.loading));
    final result = await query(state.params);
    result.fold(
      (failure) => emit(state.copyWith(status: RecentLaunchesStatus.failed)),
      (launches) {
        final allLaunches = [...state.launches, ...launches.docs];
        emit(
          state.copyWith(
            status: RecentLaunchesStatus.loaded,
            launches: allLaunches,
          ),
        );
      },
    );
  }

  void fetchMoreLaunches() async {
    if (state.status == RecentLaunchesStatus.loading ||
        state.status == RecentLaunchesStatus.more) {
      return;
    }

    emit(state.copyWith(status: RecentLaunchesStatus.more));
    final currentPage = state.params['options']?['page'] ?? 1;
    final nextPage = currentPage + 1;
    final newParams = {
      ...state.params,
      'options': {
        ...?state.params['options'],
        'page': nextPage,
      }
    };
    final result = await query(newParams);
    result.fold(
      (failure) => emit(state.copyWith(status: RecentLaunchesStatus.failed)),
      (launches) {
        final allLaunches = [...state.launches, ...launches.docs];
        emit(
          state.copyWith(
            status: RecentLaunchesStatus.loaded,
            launches: allLaunches,
            params: newParams,
          ),
        );
      },
    );
  }
}
