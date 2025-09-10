import '../../domain/entities/rocket_engines.dart';
import 'rocket_dimensions_model.dart';

class EngineIspModel extends EngineIsp {
  const EngineIspModel({
    required super.seaLevel,
    required super.vacuum,
  });

  factory EngineIspModel.fromJson(Map<String, dynamic> json) {
    return EngineIspModel(
      seaLevel: json['sea_level'] ?? 0,
      vacuum: json['vacuum'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sea_level': seaLevel,
      'vacuum': vacuum,
    };
  }
}

class RocketEnginesModel extends RocketEngines {
  const RocketEnginesModel({
    required super.number,
    required super.type,
    required super.version,
    super.layout,
    required super.isp,
    super.engineLossMax,
    required super.propellant1,
    required super.propellant2,
    required super.thrustSeaLevel,
    required super.thrustVacuum,
    super.thrustToWeight,
  });

  factory RocketEnginesModel.fromJson(Map<String, dynamic> json) {
    return RocketEnginesModel(
      number: json['number'] ?? 0,
      type: json['type'] ?? '',
      version: json['version'] ?? '',
      layout: json['layout'],
      isp: EngineIspModel.fromJson(json['isp']),
      engineLossMax: json['engine_loss_max'],
      propellant1: json['propellant_1'] ?? '',
      propellant2: json['propellant_2'] ?? '',
      thrustSeaLevel: RocketThrustModel.fromJson(json['thrust_sea_level']),
      thrustVacuum: RocketThrustModel.fromJson(json['thrust_vacuum']),
      thrustToWeight: (json['thrust_to_weight'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'type': type,
      'version': version,
      'layout': layout,
      'isp': (isp as EngineIspModel).toJson(),
      'engine_loss_max': engineLossMax,
      'propellant_1': propellant1,
      'propellant_2': propellant2,
      'thrust_sea_level': (thrustSeaLevel as RocketThrustModel).toJson(),
      'thrust_vacuum': (thrustVacuum as RocketThrustModel).toJson(),
      'thrust_to_weight': thrustToWeight,
    };
  }
}
