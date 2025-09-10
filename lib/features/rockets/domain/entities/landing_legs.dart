// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LandingLegs extends Equatable {
  final int number;
  final String? material;

  const LandingLegs({
    required this.number,
    this.material,
  });

  @override
  List<Object?> get props => [number, material];

  LandingLegs copyWith({
    int? number,
    String? material,
  }) {
    return LandingLegs(
      number: number ?? this.number,
      material: material ?? this.material,
    );
  }
}
