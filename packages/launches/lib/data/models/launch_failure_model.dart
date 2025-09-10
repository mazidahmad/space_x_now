import '../../domain/entities/launch_failure.dart';

class LaunchFailureModel extends LaunchFailure {
  const LaunchFailureModel({
    required super.time,
    super.altitude,
    required super.reason,
  });

  factory LaunchFailureModel.fromJson(Map<String, dynamic> json) {
    return LaunchFailureModel(
      time: json['time'],
      altitude: json['altitude'],
      reason: json['reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'altitude': altitude,
      'reason': reason,
    };
  }
}
