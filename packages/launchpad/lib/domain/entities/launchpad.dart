import 'package:equatable/equatable.dart';

class LaunchPad extends Equatable {
  final List<String> images;
  final String name;
  final String fullName;
  final String locality;
  final String region;
  final String timezone;
  final double latitude;
  final double longitude;
  final int launchAttempts;
  final int launchSuccesses;
  final List<String> rockets;
  final List<String> launches;
  final String? details;
  final String status;
  final String id;

  const LaunchPad({
    required this.images,
    required this.name,
    required this.fullName,
    required this.locality,
    required this.region,
    required this.timezone,
    required this.latitude,
    required this.longitude,
    required this.launchAttempts,
    required this.launchSuccesses,
    required this.rockets,
    required this.launches,
    this.details,
    required this.status,
    required this.id,
  });

  @override
  List<Object?> get props => [
        images,
        name,
        fullName,
        locality,
        region,
        timezone,
        latitude,
        longitude,
        launchAttempts,
        launchSuccesses,
        rockets,
        launches,
        details,
        status,
        id,
      ];

  // Helper getters
  bool get isActive => status.toLowerCase() == 'active';
  bool get isRetired => status.toLowerCase() == 'retired';
  bool get isUnderConstruction => status.toLowerCase() == 'under construction';
  bool get hasDetails => details != null && details!.isNotEmpty;
  bool get hasImages => images.isNotEmpty;
  double get successRate => launchAttempts > 0 ? (launchSuccesses / launchAttempts) : 0.0;
  bool get hasLaunches => launches.isNotEmpty;
  bool get supportsMultipleRockets => rockets.length > 1;
}
