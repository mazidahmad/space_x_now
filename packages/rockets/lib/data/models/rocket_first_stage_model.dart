import '../../domain/entities/rocket_first_stage.dart';
import 'rocket_dimensions_model.dart';

class RocketFirstStageModel extends RocketFirstStage {
  const RocketFirstStageModel({
    required super.reusable,
    required super.engines,
    required super.fuelAmountTons,
    super.burnTimeSec,
    required super.thrustSeaLevel,
    required super.thrustVacuum,
  });

  factory RocketFirstStageModel.fromJson(Map<String, dynamic> json) {
    return RocketFirstStageModel(
      reusable: json['reusable'] ?? false,
      engines: json['engines'] ?? 0,
      fuelAmountTons: (json['fuel_amount_tons'] as num?)?.toDouble() ?? 0.0,
      burnTimeSec: json['burn_time_sec'],
      thrustSeaLevel: RocketThrustModel.fromJson(json['thrust_sea_level']),
      thrustVacuum: RocketThrustModel.fromJson(json['thrust_vacuum']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reusable': reusable,
      'engines': engines,
      'fuel_amount_tons': fuelAmountTons,
      'burn_time_sec': burnTimeSec,
      'thrust_sea_level': (thrustSeaLevel as RocketThrustModel).toJson(),
      'thrust_vacuum': (thrustVacuum as RocketThrustModel).toJson(),
    };
  }
}
