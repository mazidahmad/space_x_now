// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LaunchFailure extends Equatable {
  final int time; // required - time in seconds
  final int? altitude; // nullable - altitude in meters
  final String reason; // required - failure reason

  const LaunchFailure({
    required this.time,
    this.altitude,
    required this.reason,
  });

  @override
  List<Object?> get props => [time, altitude, reason];

  LaunchFailure copyWith({
    int? time,
    int? altitude,
    String? reason,
  }) {
    return LaunchFailure(
      time: time ?? this.time,
      altitude: altitude ?? this.altitude,
      reason: reason ?? this.reason,
    );
  }
}
