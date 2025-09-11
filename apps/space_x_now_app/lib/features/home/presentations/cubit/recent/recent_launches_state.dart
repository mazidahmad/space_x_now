part of 'recent_launches_cubit.dart';

enum RecentLaunchesStatus { initial, loading, more, loaded, failed }

class RecentLaunchesState extends Equatable {
  final RecentLaunchesStatus status;
  final Map<String, Map<String, dynamic>> params;
  final List<Launch> launches;

  const RecentLaunchesState({
    this.status = RecentLaunchesStatus.initial,
    required this.params,
    required this.launches,
  });

  RecentLaunchesState copyWith({
    RecentLaunchesStatus? status,
    Map<String, Map<String, dynamic>>? params,
    List<Launch>? launches,
  }) {
    return RecentLaunchesState(
      status: status ?? this.status,
      params: params ?? this.params,
      launches: launches ?? this.launches,
    );
  }

  @override
  List<Object?> get props => [status, params, launches];
}
