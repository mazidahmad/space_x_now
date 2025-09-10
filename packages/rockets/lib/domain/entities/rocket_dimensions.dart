// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class RocketDimensions extends Equatable {
  final double meters;
  final double feet;

  const RocketDimensions({
    required this.meters,
    required this.feet,
  });

  @override
  List<Object?> get props => [meters, feet];

  RocketDimensions copyWith({
    double? meters,
    double? feet,
  }) {
    return RocketDimensions(
      meters: meters ?? this.meters,
      feet: feet ?? this.feet,
    );
  }
}

class RocketMass extends Equatable {
  final int kg;
  final int lb;

  const RocketMass({
    required this.kg,
    required this.lb,
  });

  @override
  List<Object?> get props => [kg, lb];
}

class RocketThrust extends Equatable {
  final int kN;
  final int lbf;

  const RocketThrust({
    required this.kN,
    required this.lbf,
  });

  @override
  List<Object?> get props => [kN, lbf];
}

class PayloadWeight extends Equatable {
  final String id;
  final String name;
  final int kg;
  final int lb;

  const PayloadWeight({
    required this.id,
    required this.name,
    required this.kg,
    required this.lb,
  });

  @override
  List<Object?> get props => [id, name, kg, lb];
}
