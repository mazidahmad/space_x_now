// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'landing_legs.dart';
import 'rocket_dimensions.dart';
import 'rocket_engines.dart';
import 'rocket_first_stage.dart';
import 'rocket_second_stage.dart';

class Rocket extends Equatable {
  final String name;
  final String type;
  final bool active;
  final int stages;
  final int boosters;
  final int costPerLaunch;
  final int successRatePct;
  final String firstFlight;
  final String country;
  final String company;
  final RocketDimensions height;
  final RocketDimensions diameter;
  final RocketMass mass;
  final List<PayloadWeight> payloadWeights;
  final RocketFirstStage firstStage;
  final RocketSecondStage secondStage;
  final RocketEngines engines;
  final LandingLegs landingLegs;
  final List<String> flickrImages;
  final String? wikipedia;
  final String description;
  final String id;

  const Rocket({
    required this.name,
    required this.type,
    required this.active,
    required this.stages,
    required this.boosters,
    required this.costPerLaunch,
    required this.successRatePct,
    required this.firstFlight,
    required this.country,
    required this.company,
    required this.height,
    required this.diameter,
    required this.mass,
    required this.payloadWeights,
    required this.firstStage,
    required this.secondStage,
    required this.engines,
    required this.landingLegs,
    required this.flickrImages,
    this.wikipedia,
    required this.description,
    required this.id,
  });

  @override
  List<Object?> get props => [
        name,
        type,
        active,
        stages,
        boosters,
        costPerLaunch,
        successRatePct,
        firstFlight,
        country,
        company,
        height,
        diameter,
        mass,
        payloadWeights,
        firstStage,
        secondStage,
        engines,
        landingLegs,
        flickrImages,
        wikipedia,
        description,
        id,
      ];

  // Helper getters
  bool get isActive => active;
  bool get isReusable => firstStage.reusable;
  bool get hasLandingLegs => landingLegs.number > 0;
  double get heightInMeters => height.meters;
  double get heightInFeet => height.feet;
  int get totalEngines => engines.number;
  String get fuelType => '${engines.propellant1} / ${engines.propellant2}';

  Rocket copyWith({
    String? name,
    String? type,
    bool? active,
    int? stages,
    int? boosters,
    int? costPerLaunch,
    int? successRatePct,
    String? firstFlight,
    String? country,
    String? company,
    RocketDimensions? height,
    RocketDimensions? diameter,
    RocketMass? mass,
    List<PayloadWeight>? payloadWeights,
    RocketFirstStage? firstStage,
    RocketSecondStage? secondStage,
    RocketEngines? engines,
    LandingLegs? landingLegs,
    List<String>? flickrImages,
    String? wikipedia,
    String? description,
    String? id,
  }) {
    return Rocket(
      name: name ?? this.name,
      type: type ?? this.type,
      active: active ?? this.active,
      stages: stages ?? this.stages,
      boosters: boosters ?? this.boosters,
      costPerLaunch: costPerLaunch ?? this.costPerLaunch,
      successRatePct: successRatePct ?? this.successRatePct,
      firstFlight: firstFlight ?? this.firstFlight,
      country: country ?? this.country,
      company: company ?? this.company,
      height: height ?? this.height,
      diameter: diameter ?? this.diameter,
      mass: mass ?? this.mass,
      payloadWeights: payloadWeights ?? this.payloadWeights,
      firstStage: firstStage ?? this.firstStage,
      secondStage: secondStage ?? this.secondStage,
      engines: engines ?? this.engines,
      landingLegs: landingLegs ?? this.landingLegs,
      flickrImages: flickrImages ?? this.flickrImages,
      wikipedia: wikipedia ?? this.wikipedia,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }
}
