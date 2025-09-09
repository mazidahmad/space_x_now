part of 'startup_cubit.dart';

enum StartupStatus { initial, loading, success, failure }

class StartupState extends Equatable {
  const StartupState({
    this.status = StartupStatus.initial,
    this.failure,
  });

  final StartupStatus status;
  final Failure? failure;

  @override
  List<Object?> get props => [status, failure];
}
