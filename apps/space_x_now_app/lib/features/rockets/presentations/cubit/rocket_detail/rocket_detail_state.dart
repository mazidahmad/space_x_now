part of 'rocket_detail_cubit.dart';

enum RocketDetailStatus { initial, loading, success, failure }

class RocketDetailState extends Equatable {
  final RocketDetailStatus status;
  final Rocket? rocket;
  final bool isFavorited;
  final Failure? failure;

  const RocketDetailState({
    this.status = RocketDetailStatus.initial,
    this.rocket,
    this.isFavorited = false,
    this.failure,
  });

  RocketDetailState copyWith({
    RocketDetailStatus? status,
    Rocket? rocket,
    bool? isFavorited,
    Failure? failure,
  }) {
    return RocketDetailState(
      status: status ?? this.status,
      rocket: rocket ?? this.rocket,
      failure: failure ?? this.failure,
      isFavorited: isFavorited ?? this.isFavorited,
    );
  }

  @override
  List<Object?> get props => [status, rocket, failure, isFavorited];
}
