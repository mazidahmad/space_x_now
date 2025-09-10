import '../../domain/entities/launch_core.dart';

class LaunchCoreModel extends LaunchCore {
  const LaunchCoreModel({
    super.core,
    super.flight,
    super.gridfins,
    super.legs,
    super.reused,
    super.landingAttempt,
    super.landingSuccess,
    super.landingType,
    super.landpad,
  });

  factory LaunchCoreModel.fromJson(Map<String, dynamic> json) {
    return LaunchCoreModel(
      core: json['core'],
      flight: json['flight'],
      gridfins: json['gridfins'],
      legs: json['legs'],
      reused: json['reused'],
      landingAttempt: json['landing_attempt'],
      landingSuccess: json['landing_success'],
      landingType: json['landing_type'],
      landpad: json['landpad'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'core': core,
      'flight': flight,
      'gridfins': gridfins,
      'legs': legs,
      'reused': reused,
      'landing_attempt': landingAttempt,
      'landing_success': landingSuccess,
      'landing_type': landingType,
      'landpad': landpad,
    };
  }
}
