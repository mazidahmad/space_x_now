import 'package:space_x_launchpad/data/models/launchpad_model.dart';
import 'package:space_x_rockets/data/models/rocket_model.dart';

import '../../domain/entities/launch.dart';
import 'fairings_model.dart';
import 'launch_links_model.dart';
import 'launch_core_model.dart';
import 'launch_failure_model.dart';

class LaunchModel extends Launch {
  const LaunchModel({
    super.fairings,
    required super.links,
    super.staticFireDateUtc,
    super.staticFireDateUnix,
    required super.tdb,
    required super.net,
    super.window,
    super.rocket,
    super.success,
    required super.failures,
    super.details,
    required super.crew,
    required super.ships,
    required super.capsules,
    required super.payloads,
    super.launchpad,
    required super.autoUpdate,
    required super.flightNumber,
    required super.name,
    required super.dateUtc,
    required super.dateUnix,
    required super.dateLocal,
    required super.datePrecision,
    required super.upcoming,
    required super.cores,
    required super.id,
  });

  factory LaunchModel.fromJson(Map<String, dynamic> json) {
    return LaunchModel(
      fairings: json['fairings'] != null
          ? FairingsModel.fromJson(json['fairings'])
          : null,
      links: LaunchLinksModel.fromJson(json['links']),
      staticFireDateUtc: json['static_fire_date_utc'],
      staticFireDateUnix: json['static_fire_date_unix'],
      tdb: json['tdb'] ?? false,
      net: json['net'] ?? false,
      window: json['window'],
      rocket:
          json['rocket'] != null ? RocketModel.fromJson(json['rocket']) : null,
      success: json['success'],
      failures: (json['failures'] as List<dynamic>?)
              ?.map((failure) => LaunchFailureModel.fromJson(failure))
              .toList() ??
          [],
      details: json['details'],
      crew: List<String>.from(json['crew'] ?? []),
      ships: List<String>.from(json['ships'] ?? []),
      capsules: List<String>.from(json['capsules'] ?? []),
      payloads: List<String>.from(json['payloads'] ?? []),
      launchpad: json['launchpad'] != null
          ? LaunchPadModel.fromJson(json['launchpad'])
          : null,
      autoUpdate: json['auto_update'] ?? true,
      flightNumber: json['flight_number'],
      name: json['name'],
      dateUtc: json['date_utc'],
      dateUnix: json['date_unix'],
      dateLocal: json['date_local'],
      datePrecision: json['date_precision'],
      upcoming: json['upcoming'] ?? false,
      cores: (json['cores'] as List<dynamic>?)
              ?.map((core) => LaunchCoreModel.fromJson(core))
              .toList() ??
          [],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fairings': fairings != null && fairings is FairingsModel
          ? (fairings as FairingsModel).toJson()
          : null,
      'links': (links as LaunchLinksModel).toJson(),
      'static_fire_date_utc': staticFireDateUtc,
      'static_fire_date_unix': staticFireDateUnix,
      'tdb': tdb,
      'net': net,
      'window': window,
      'rocket': rocket,
      'success': success,
      'failures': failures
          .map((failure) => (failure as LaunchFailureModel).toJson())
          .toList(),
      'details': details,
      'crew': crew,
      'ships': ships,
      'capsules': capsules,
      'payloads': payloads,
      'launchpad': launchpad,
      'auto_update': autoUpdate,
      'flight_number': flightNumber,
      'name': name,
      'date_utc': dateUtc,
      'date_unix': dateUnix,
      'date_local': dateLocal,
      'date_precision': datePrecision,
      'upcoming': upcoming,
      'cores': cores.map((core) => (core as LaunchCoreModel).toJson()).toList(),
      'id': id,
    };
  }
}
