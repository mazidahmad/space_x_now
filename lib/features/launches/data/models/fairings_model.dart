import '../../domain/entities/fairings.dart';

class FairingsModel extends Fairings {
  const FairingsModel({
    super.reused,
    super.recoveryAttempt,
    super.recovered,
    required super.ships,
  });

  factory FairingsModel.fromJson(Map<String, dynamic> json) {
    return FairingsModel(
      reused: json['reused'],
      recoveryAttempt: json['recovery_attempt'],
      recovered: json['recovered'],
      ships: List<String>.from(json['ships'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reused': reused,
      'recovery_attempt': recoveryAttempt,
      'recovered': recovered,
      'ships': ships,
    };
  }
}
