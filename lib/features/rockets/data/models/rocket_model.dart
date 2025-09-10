import '../../domain/entities/rocket.dart';
import 'rocket_dimensions_model.dart';
import 'rocket_first_stage_model.dart';
import 'rocket_second_stage_model.dart';
import 'rocket_engines_model.dart';
import 'landing_legs_model.dart';

class RocketModel extends Rocket {
  const RocketModel({
    required super.name,
    required super.type,
    required super.active,
    required super.stages,
    required super.boosters,
    required super.costPerLaunch,
    required super.successRatePct,
    required super.firstFlight,
    required super.country,
    required super.company,
    required super.height,
    required super.diameter,
    required super.mass,
    required super.payloadWeights,
    required super.firstStage,
    required super.secondStage,
    required super.engines,
    required super.landingLegs,
    required super.flickrImages,
    super.wikipedia,
    required super.description,
    required super.id,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    return RocketModel(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      active: json['active'] ?? false,
      stages: json['stages'] ?? 0,
      boosters: json['boosters'] ?? 0,
      costPerLaunch: json['cost_per_launch'] ?? 0,
      successRatePct: json['success_rate_pct'] ?? 0,
      firstFlight: json['first_flight'] ?? '',
      country: json['country'] ?? '',
      company: json['company'] ?? '',
      height: RocketDimensionsModel.fromJson(json['height']),
      diameter: RocketDimensionsModel.fromJson(json['diameter']),
      mass: RocketMassModel.fromJson(json['mass']),
      payloadWeights: (json['payload_weights'] as List<dynamic>?)
              ?.map((pw) => PayloadWeightModel.fromJson(pw))
              .toList() ??
          [],
      firstStage: RocketFirstStageModel.fromJson(json['first_stage']),
      secondStage: RocketSecondStageModel.fromJson(json['second_stage']),
      engines: RocketEnginesModel.fromJson(json['engines']),
      landingLegs: LandingLegsModel.fromJson(json['landing_legs']),
      flickrImages: List<String>.from(json['flickr_images'] ?? []),
      wikipedia: json['wikipedia'],
      description: json['description'] ?? '',
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'active': active,
      'stages': stages,
      'boosters': boosters,
      'cost_per_launch': costPerLaunch,
      'success_rate_pct': successRatePct,
      'first_flight': firstFlight,
      'country': country,
      'company': company,
      'height': (height as RocketDimensionsModel).toJson(),
      'diameter': (diameter as RocketDimensionsModel).toJson(),
      'mass': (mass as RocketMassModel).toJson(),
      'payload_weights': payloadWeights
          .map((pw) => (pw as PayloadWeightModel).toJson())
          .toList(),
      'first_stage': (firstStage as RocketFirstStageModel).toJson(),
      'second_stage': (secondStage as RocketSecondStageModel).toJson(),
      'engines': (engines as RocketEnginesModel).toJson(),
      'landing_legs': (landingLegs as LandingLegsModel).toJson(),
      'flickr_images': flickrImages,
      'wikipedia': wikipedia,
      'description': description,
      'id': id,
    };
  }
}
