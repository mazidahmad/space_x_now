// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'rocket_dimensions.dart';

class EngineIsp extends Equatable {
  final int seaLevel;
  final int vacuum;

  const EngineIsp({
    required this.seaLevel,
    required this.vacuum,
  });

  @override
  List<Object?> get props => [seaLevel, vacuum];

  EngineIsp copyWith({
    int? seaLevel,
    int? vacuum,
  }) {
    return EngineIsp(
      seaLevel: seaLevel ?? this.seaLevel,
      vacuum: vacuum ?? this.vacuum,
    );
  }
}

class RocketEngines extends Equatable {
  final int number;
  final String type;
  final String version;
  final String? layout;
  final EngineIsp isp;
  final int? engineLossMax;
  final String propellant1;
  final String propellant2;
  final RocketThrust thrustSeaLevel;
  final RocketThrust thrustVacuum;
  final double? thrustToWeight;

  const RocketEngines({
    required this.number,
    required this.type,
    required this.version,
    this.layout,
    required this.isp,
    this.engineLossMax,
    required this.propellant1,
    required this.propellant2,
    required this.thrustSeaLevel,
    required this.thrustVacuum,
    this.thrustToWeight,
  });

  @override
  List<Object?> get props => [
        number,
        type,
        version,
        layout,
        isp,
        engineLossMax,
        propellant1,
        propellant2,
        thrustSeaLevel,
        thrustVacuum,
        thrustToWeight,
      ];
}
