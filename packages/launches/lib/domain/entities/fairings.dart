// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Fairings extends Equatable {
  final bool? reused; // nullable - default: null
  final bool? recoveryAttempt; // nullable - default: null
  final bool? recovered; // nullable - default: null
  final List<String> ships; // required - array of ship UUIDs

  const Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    required this.ships,
  });

  @override
  List<Object?> get props => [reused, recoveryAttempt, recovered, ships];

  Fairings copyWith({
    bool? reused,
    bool? recoveryAttempt,
    bool? recovered,
    List<String>? ships,
  }) {
    return Fairings(
      reused: reused ?? this.reused,
      recoveryAttempt: recoveryAttempt ?? this.recoveryAttempt,
      recovered: recovered ?? this.recovered,
      ships: ships ?? this.ships,
    );
  }
}
