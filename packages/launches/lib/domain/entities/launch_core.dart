// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LaunchCore extends Equatable {
  final String? core; // nullable - default: null (UUID)
  final int? flight; // nullable - default: null
  final bool? gridfins; // nullable - default: null
  final bool? legs; // nullable - default: null
  final bool? reused; // nullable - default: null
  final bool? landingAttempt; // nullable - default: null
  final bool? landingSuccess; // nullable - default: null
  final String? landingType; // nullable - default: null
  final String? landpad; // nullable - default: null (UUID)

  const LaunchCore({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  @override
  List<Object?> get props => [
        core,
        flight,
        gridfins,
        legs,
        reused,
        landingAttempt,
        landingSuccess,
        landingType,
        landpad,
      ];

  LaunchCore copyWith({
    String? core,
    int? flight,
    bool? gridfins,
    bool? legs,
    bool? reused,
    bool? landingAttempt,
    bool? landingSuccess,
    String? landingType,
    String? landpad,
  }) {
    return LaunchCore(
      core: core ?? this.core,
      flight: flight ?? this.flight,
      gridfins: gridfins ?? this.gridfins,
      legs: legs ?? this.legs,
      reused: reused ?? this.reused,
      landingAttempt: landingAttempt ?? this.landingAttempt,
      landingSuccess: landingSuccess ?? this.landingSuccess,
      landingType: landingType ?? this.landingType,
      landpad: landpad ?? this.landpad,
    );
  }
}
