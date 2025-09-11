part of 'rockets_cubit.dart';

enum RocketsStatus { initial, loading, more, success, failure }

enum RocketsFilter { all, active, inactive }

class RocketsState extends Equatable {
  final RocketsStatus status;
  final List<Rocket> rockets;
  final Failure? failure;
  final Map<String, Map<String, dynamic>> params;

  const RocketsState({
    this.status = RocketsStatus.initial,
    this.rockets = const [],
    this.failure,
    required this.params,
  });

  RocketsState copyWith({
    RocketsStatus? status,
    List<Rocket>? rockets,
    Map<String, Map<String, dynamic>>? params,
    Failure? failure,
  }) {
    return RocketsState(
      status: status ?? this.status,
      rockets: rockets ?? this.rockets,
      failure: failure ?? this.failure,
      params: params ?? this.params,
    );
  }

  bool? get isActive => params['query']?['active'] as bool?;

  @override
  List<Object?> get props => [status, rockets, failure, params];
}
