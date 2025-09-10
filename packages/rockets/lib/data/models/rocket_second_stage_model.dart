import '../../domain/entities/rocket_second_stage.dart';
import 'rocket_dimensions_model.dart';

class CompositeFairingModel extends CompositeFairing {
  const CompositeFairingModel({
    required super.height,
    required super.diameter,
  });

  factory CompositeFairingModel.fromJson(Map<String, dynamic> json) {
    return CompositeFairingModel(
      height: RocketDimensionsModel.fromJson(json['height']),
      diameter: RocketDimensionsModel.fromJson(json['diameter']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': (height as RocketDimensionsModel).toJson(),
      'diameter': (diameter as RocketDimensionsModel).toJson(),
    };
  }
}

class SecondStagePayloadsModel extends SecondStagePayloads {
  const SecondStagePayloadsModel({
    super.option1,
    super.compositeFairing,
  });

  factory SecondStagePayloadsModel.fromJson(Map<String, dynamic> json) {
    return SecondStagePayloadsModel(
      option1: json['option_1'],
      compositeFairing: json['composite_fairing'] != null
          ? CompositeFairingModel.fromJson(json['composite_fairing'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'option_1': option1,
      'composite_fairing': compositeFairing != null
          ? (compositeFairing as CompositeFairingModel).toJson()
          : null,
    };
  }
}

class RocketSecondStageModel extends RocketSecondStage {
  const RocketSecondStageModel({
    super.reusable,
    required super.engines,
    required super.fuelAmountTons,
    super.burnTimeSec,
    required super.thrust,
    required super.payloads,
  });

  factory RocketSecondStageModel.fromJson(Map<String, dynamic> json) {
    return RocketSecondStageModel(
      reusable: json['reusable'],
      engines: json['engines'] ?? 0,
      fuelAmountTons: (json['fuel_amount_tons'] as num?)?.toDouble() ?? 0.0,
      burnTimeSec: json['burn_time_sec'],
      thrust: RocketThrustModel.fromJson(json['thrust']),
      payloads: SecondStagePayloadsModel.fromJson(json['payloads']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reusable': reusable,
      'engines': engines,
      'fuel_amount_tons': fuelAmountTons,
      'burn_time_sec': burnTimeSec,
      'thrust': (thrust as RocketThrustModel).toJson(),
      'payloads': (payloads as SecondStagePayloadsModel).toJson(),
    };
  }
}
