// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'rocket_dimensions.dart';

class CompositeFairing extends Equatable {
  final RocketDimensions height;
  final RocketDimensions diameter;

  const CompositeFairing({
    required this.height,
    required this.diameter,
  });

  @override
  List<Object?> get props => [height, diameter];

  CompositeFairing copyWith({
    RocketDimensions? height,
    RocketDimensions? diameter,
  }) {
    return CompositeFairing(
      height: height ?? this.height,
      diameter: diameter ?? this.diameter,
    );
  }
}

class SecondStagePayloads extends Equatable {
  final String? option1;
  final CompositeFairing? compositeFairing;

  const SecondStagePayloads({
    this.option1,
    this.compositeFairing,
  });

  @override
  List<Object?> get props => [option1, compositeFairing];

  SecondStagePayloads copyWith({
    String? option1,
    CompositeFairing? compositeFairing,
  }) {
    return SecondStagePayloads(
      option1: option1 ?? this.option1,
      compositeFairing: compositeFairing ?? this.compositeFairing,
    );
  }
}

class RocketSecondStage extends Equatable {
  final bool? reusable;
  final int engines;
  final double fuelAmountTons;
  final int? burnTimeSec;
  final RocketThrust thrust;
  final SecondStagePayloads payloads;

  const RocketSecondStage({
    this.reusable,
    required this.engines,
    required this.fuelAmountTons,
    this.burnTimeSec,
    required this.thrust,
    required this.payloads,
  });

  @override
  List<Object?> get props => [
        reusable,
        engines,
        fuelAmountTons,
        burnTimeSec,
        thrust,
        payloads,
      ];

  RocketSecondStage copyWith({
    bool? reusable,
    int? engines,
    double? fuelAmountTons,
    int? burnTimeSec,
    RocketThrust? thrust,
    SecondStagePayloads? payloads,
  }) {
    return RocketSecondStage(
      reusable: reusable ?? this.reusable,
      engines: engines ?? this.engines,
      fuelAmountTons: fuelAmountTons ?? this.fuelAmountTons,
      burnTimeSec: burnTimeSec ?? this.burnTimeSec,
      thrust: thrust ?? this.thrust,
      payloads: payloads ?? this.payloads,
    );
  }
}
