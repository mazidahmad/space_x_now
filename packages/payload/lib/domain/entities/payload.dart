import 'package:equatable/equatable.dart';

class Payload extends Equatable {
  final List<String> customers;
  final List<String> nationalities;
  final List<String> manufacturers;
  final double? massKg;
  final double? massLbs;
  final String? orbit;
  final String? referenceSystem;
  final String? regime;
  final double? longitude;
  final double? semiMajorAxisKm;
  final double? eccentricity;
  final double? periapsisKm;
  final double? apoapsisKm;
  final double? inclinationDeg;
  final double? periodMin;
  final int? lifespanYears;
  final String? epoch;
  final double? meanMotion;
  final double? raan;
  final double? argOfPericenter;
  final double? meanAnomaly;
  final String name;
  final String type;
  final bool reused;
  final String? launch;
  final String id;

  const Payload({
    required this.customers,
    required this.nationalities,
    required this.manufacturers,
    this.massKg,
    this.massLbs,
    this.orbit,
    this.referenceSystem,
    this.regime,
    this.longitude,
    this.semiMajorAxisKm,
    this.eccentricity,
    this.periapsisKm,
    this.apoapsisKm,
    this.inclinationDeg,
    this.periodMin,
    this.lifespanYears,
    this.epoch,
    this.meanMotion,
    this.raan,
    this.argOfPericenter,
    this.meanAnomaly,
    required this.name,
    required this.type,
    required this.reused,
    this.launch,
    required this.id,
  });

  @override
  List<Object?> get props => [
        customers,
        nationalities,
        manufacturers,
        massKg,
        massLbs,
        orbit,
        referenceSystem,
        regime,
        longitude,
        semiMajorAxisKm,
        eccentricity,
        periapsisKm,
        apoapsisKm,
        inclinationDeg,
        periodMin,
        lifespanYears,
        epoch,
        meanMotion,
        raan,
        argOfPericenter,
        meanAnomaly,
        name,
        type,
        reused,
        launch,
        id,
      ];

  // Helper getters
  bool get hasCustomers => customers.isNotEmpty;
  bool get hasManufacturers => manufacturers.isNotEmpty;
  bool get hasNationalities => nationalities.isNotEmpty;
  bool get hasMass => massKg != null;
  bool get hasOrbit => orbit != null;
  bool get isLaunched => launch != null;
  bool get hasOrbitalData => semiMajorAxisKm != null;
  String get primaryCustomer => customers.isNotEmpty ? customers.first : 'Unknown';
  String get primaryNationality => nationalities.isNotEmpty ? nationalities.first : 'Unknown';
  String get primaryManufacturer => manufacturers.isNotEmpty ? manufacturers.first : 'Unknown';
  double get massInTons => massKg != null ? massKg! / 1000 : 0.0;
}
