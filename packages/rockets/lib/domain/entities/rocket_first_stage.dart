// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'rocket_dimensions.dart';

class RocketFirstStage extends Equatable {
  final bool reusable;
  final int engines;
  final double fuelAmountTons;
  final int? burnTimeSec;
  final RocketThrust thrustSeaLevel;
  final RocketThrust thrustVacuum;

  const RocketFirstStage({
    required this.reusable,
    required this.engines,
    required this.fuelAmountTons,
    this.burnTimeSec,
    required this.thrustSeaLevel,
    required this.thrustVacuum,
  });

  @override
  List<Object?> get props => [
        reusable,
        engines,
        fuelAmountTons,
        burnTimeSec,
        thrustSeaLevel,
        thrustVacuum,
      ];

  RocketFirstStage copyWith({
    bool? reusable,
    int? engines,
    double? fuelAmountTons,
    int? burnTimeSec,
    RocketThrust? thrustSeaLevel,
    RocketThrust? thrustVacuum,
  }) {
    return RocketFirstStage(
      reusable: reusable ?? this.reusable,
      engines: engines ?? this.engines,
      fuelAmountTons: fuelAmountTons ?? this.fuelAmountTons,
      burnTimeSec: burnTimeSec ?? this.burnTimeSec,
      thrustSeaLevel: thrustSeaLevel ?? this.thrustSeaLevel,
      thrustVacuum: thrustVacuum ?? this.thrustVacuum,
    );
  }
}
