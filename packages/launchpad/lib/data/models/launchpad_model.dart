import '../../domain/entities/launchpad.dart';

class LaunchPadModel extends LaunchPad {
  const LaunchPadModel({
    required super.images,
    required super.name,
    required super.fullName,
    required super.locality,
    required super.region,
    required super.timezone,
    required super.latitude,
    required super.longitude,
    required super.launchAttempts,
    required super.launchSuccesses,
    required super.rockets,
    required super.launches,
    super.details,
    required super.status,
    required super.id,
  });

  factory LaunchPadModel.fromJson(Map<String, dynamic> json) {
    return LaunchPadModel(
      images: List<String>.from(json['images'] ?? []),
      name: json['name'] ?? '',
      fullName: json['full_name'] ?? '',
      locality: json['locality'] ?? '',
      region: json['region'] ?? '',
      timezone: json['timezone'] ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      launchAttempts: json['launch_attempts'] ?? 0,
      launchSuccesses: json['launch_successes'] ?? 0,
      rockets: List<String>.from(json['rockets'] ?? []),
      launches: List<String>.from(json['launches'] ?? []),
      details: json['details'],
      status: json['status'] ?? '',
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
      'name': name,
      'full_name': fullName,
      'locality': locality,
      'region': region,
      'timezone': timezone,
      'latitude': latitude,
      'longitude': longitude,
      'launch_attempts': launchAttempts,
      'launch_successes': launchSuccesses,
      'rockets': rockets,
      'launches': launches,
      'details': details,
      'status': status,
      'id': id,
    };
  }

  LaunchPadModel copyWith({
    List<String>? images,
    String? name,
    String? fullName,
    String? locality,
    String? region,
    String? timezone,
    double? latitude,
    double? longitude,
    int? launchAttempts,
    int? launchSuccesses,
    List<String>? rockets,
    List<String>? launches,
    String? details,
    String? status,
    String? id,
  }) {
    return LaunchPadModel(
      images: images ?? this.images,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      locality: locality ?? this.locality,
      region: region ?? this.region,
      timezone: timezone ?? this.timezone,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      launchAttempts: launchAttempts ?? this.launchAttempts,
      launchSuccesses: launchSuccesses ?? this.launchSuccesses,
      rockets: rockets ?? this.rockets,
      launches: launches ?? this.launches,
      details: details ?? this.details,
      status: status ?? this.status,
      id: id ?? this.id,
    );
  }
}
