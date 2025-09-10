import '../../domain/entities/landing_legs.dart';

class LandingLegsModel extends LandingLegs {
  const LandingLegsModel({
    required super.number,
    super.material,
  });

  factory LandingLegsModel.fromJson(Map<String, dynamic> json) {
    return LandingLegsModel(
      number: json['number'] ?? 0,
      material: json['material']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'material': material,
    };
  }
}
