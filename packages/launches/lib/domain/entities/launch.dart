import 'package:space_x_launchpad/domain/entities/launchpad.dart';
import 'package:space_x_now_core/core.dart';
// import 'package:space_x_payload/domain/entities/payload.dart';
import 'package:space_x_rockets/domain/entities/rocket.dart';

import 'fairings.dart';
import 'launch_core.dart';
import 'launch_failure.dart';
import 'launch_links.dart';

class Launch extends Equatable {
  final Fairings? fairings; // nullable - can be null
  final LaunchLinks links; // required - always present
  final String? staticFireDateUtc; // nullable - default: null
  final int? staticFireDateUnix; // nullable - default: null
  final bool tdb; // required - default: false (To Be Determined)
  final bool net; // required - default: false (No Earlier Than)
  final int? window; // nullable - default: null (launch window in seconds)
  final Rocket? rocket; // nullable - default: null (rocket UUID)
  final bool? success; // nullable - default: null (null for upcoming)
  final List<LaunchFailure> failures; // required - array (can be empty)
  final String? details; // nullable - default: null
  final List<String> crew; // required - array of crew UUIDs (can be empty)
  final List<String> ships; // required - array of ship UUIDs (can be empty)
  final List<String>
      capsules; // required - array of capsule UUIDs (can be empty)
  final List<String>
      payloads; // required - array of payload UUIDs (can be empty)
  final LaunchPad? launchpad; // nullable - default: null (launchpad UUID)
  final bool autoUpdate; // required - default: true
  final int flightNumber; // required - unique flight number
  final String name; // required - mission name
  final String dateUtc; // required - UTC date/time
  final int dateUnix; // required - Unix timestamp
  final String dateLocal; // required - local date/time
  final String datePrecision; // required - precision level
  final bool upcoming; // required - is upcoming launch
  final List<LaunchCore> cores; // required - array of cores (can be empty)
  final String id; // required - unique identifier

  // Related Entities
  // final Rocket? rocketData; // Rocket entity
  // final LaunchPad? launchpadData; // LaunchPad entity
  // final List<Payload>? payloadData; // Payload entity

  const Launch({
    this.fairings,
    required this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    required this.tdb,
    required this.net,
    this.window,
    this.rocket,
    this.success,
    required this.failures,
    this.details,
    required this.crew,
    required this.ships,
    required this.capsules,
    required this.payloads,
    this.launchpad,
    required this.autoUpdate,
    required this.flightNumber,
    required this.name,
    required this.dateUtc,
    required this.dateUnix,
    required this.dateLocal,
    required this.datePrecision,
    required this.upcoming,
    required this.cores,
    required this.id,
    // this.rocketData,
    // this.launchpadData,
    // this.payloadData,
  });

  @override
  List<Object?> get props => [
        fairings,
        links,
        staticFireDateUtc,
        staticFireDateUnix,
        tdb,
        net,
        window,
        rocket,
        success,
        failures,
        details,
        crew,
        ships,
        capsules,
        payloads,
        launchpad,
        autoUpdate,
        flightNumber,
        name,
        dateUtc,
        dateUnix,
        dateLocal,
        datePrecision,
        upcoming,
        cores,
        id,
        // rocketData,
        // launchpadData,
        // payloadData,
      ];

  /// Helper getters for common use cases
  bool get isSuccessful => success == true;
  bool get isFailed => success == false;
  bool get isPending => success == null;
  bool get hasFairings => fairings != null;
  bool get hasFailures => failures.isNotEmpty;
  bool get hasCrew => crew.isNotEmpty;
  bool get hasDetails => details != null && details!.isNotEmpty;

  String get parsedDate {
    try {
      return DateFormat('MMM dd, yyyy - HH:mm')
          .format(DateTime.parse(dateUtc).toLocal());
    } catch (_) {
      return dateUtc;
    }
  }

  Launch copyWith({
    Fairings? fairings,
    LaunchLinks? links,
    String? staticFireDateUtc,
    int? staticFireDateUnix,
    bool? tdb,
    bool? net,
    int? window,
    Rocket? rocket,
    bool? success,
    List<LaunchFailure>? failures,
    String? details,
    List<String>? crew,
    List<String>? ships,
    List<String>? capsules,
    List<String>? payloads,
    LaunchPad? launchpad,
    bool? autoUpdate,
    int? flightNumber,
    String? name,
    String? dateUtc,
    int? dateUnix,
    String? dateLocal,
    String? datePrecision,
    bool? upcoming,
    List<LaunchCore>? cores,
    String? id,
    // Rocket? rocketData,
    // LaunchPad? launchpadData,
    // List<Payload>? payloadData,
  }) {
    return Launch(
      fairings: fairings ?? this.fairings,
      links: links ?? this.links,
      staticFireDateUtc: staticFireDateUtc ?? this.staticFireDateUtc,
      staticFireDateUnix: staticFireDateUnix ?? this.staticFireDateUnix,
      tdb: tdb ?? this.tdb,
      net: net ?? this.net,
      window: window ?? this.window,
      rocket: rocket ?? this.rocket,
      success: success ?? this.success,
      failures: failures ?? this.failures,
      details: details ?? this.details,
      crew: crew ?? this.crew,
      ships: ships ?? this.ships,
      capsules: capsules ?? this.capsules,
      payloads: payloads ?? this.payloads,
      launchpad: launchpad ?? this.launchpad,
      autoUpdate: autoUpdate ?? this.autoUpdate,
      flightNumber: flightNumber ?? this.flightNumber,
      name: name ?? this.name,
      dateUtc: dateUtc ?? this.dateUtc,
      dateUnix: dateUnix ?? this.dateUnix,
      dateLocal: dateLocal ?? this.dateLocal,
      datePrecision: datePrecision ?? this.datePrecision,
      upcoming: upcoming ?? this.upcoming,
      cores: cores ?? this.cores,
      id: id ?? this.id,
      // rocketData: rocketData ?? this.rocketData,
      // launchpadData: launchpadData ?? this.launchpadData,
      // payloadData: payloadData ?? this.payloadData,
    );
  }
}
