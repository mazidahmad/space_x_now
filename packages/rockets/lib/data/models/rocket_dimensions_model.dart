import '../../domain/entities/rocket_dimensions.dart';

class RocketDimensionsModel extends RocketDimensions {
  const RocketDimensionsModel({
    required super.meters,
    required super.feet,
  });

  factory RocketDimensionsModel.fromJson(Map<String, dynamic> json) {
    return RocketDimensionsModel(
      meters: (json['meters'] as num).toDouble(),
      feet: (json['feet'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meters': meters,
      'feet': feet,
    };
  }
}

class RocketMassModel extends RocketMass {
  const RocketMassModel({
    required super.kg,
    required super.lb,
  });

  factory RocketMassModel.fromJson(Map<String, dynamic> json) {
    return RocketMassModel(
      kg: json['kg'],
      lb: json['lb'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kg': kg,
      'lb': lb,
    };
  }
}

class RocketThrustModel extends RocketThrust {
  const RocketThrustModel({
    required super.kN,
    required super.lbf,
  });

  factory RocketThrustModel.fromJson(Map<String, dynamic> json) {
    return RocketThrustModel(
      kN: json['kN'],
      lbf: json['lbf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kN': kN,
      'lbf': lbf,
    };
  }
}

class PayloadWeightModel extends PayloadWeight {
  const PayloadWeightModel({
    required super.id,
    required super.name,
    required super.kg,
    required super.lb,
  });

  factory PayloadWeightModel.fromJson(Map<String, dynamic> json) {
    return PayloadWeightModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      kg: json['kg'] ?? 0,
      lb: json['lb'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'kg': kg,
      'lb': lb,
    };
  }
}
