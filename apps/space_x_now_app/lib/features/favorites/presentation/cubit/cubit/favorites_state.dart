part of 'favorites_cubit.dart';

enum FavoritesStatus { initial, loading, loaded, failed }

class FavoritesState extends Equatable {
  final FavoritesStatus status;
  final List<Rocket> rockets;
  final Failure? failure;

  const FavoritesState({
    this.status = FavoritesStatus.initial,
    this.rockets = const [],
    this.failure,
  });

  FavoritesState copyWith({
    FavoritesStatus? status,
    List<Rocket>? rockets,
    Failure? failure,
  }) {
    return FavoritesState(
      status: status ?? this.status,
      rockets: rockets ?? this.rockets,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, rockets, failure];
}
