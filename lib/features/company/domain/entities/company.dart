import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String name;
  final String founder;
  final int founded;
  final int employees;
  final int vehicles;
  final int launchSites;
  final int testSites;
  final String ceo;
  final String cto;
  final String coo;
  final String ctoPropulsion;
  final int valuation;
  final Headquarters headquarters;
  final CompanyLinks links;
  final String summary;

  const Company({
    required this.name,
    required this.founder,
    required this.founded,
    required this.employees,
    required this.vehicles,
    required this.launchSites,
    required this.testSites,
    required this.ceo,
    required this.cto,
    required this.coo,
    required this.ctoPropulsion,
    required this.valuation,
    required this.headquarters,
    required this.links,
    required this.summary,
  });

  @override
  List<Object?> get props => [
        name,
        founder,
        founded,
        employees,
        vehicles,
        launchSites,
        testSites,
        ceo,
        cto,
        coo,
        ctoPropulsion,
        valuation,
        headquarters,
        links,
        summary,
      ];

  Company copyWith({
    String? name,
    String? founder,
    int? founded,
    int? employees,
    int? vehicles,
    int? launchSites,
    int? testSites,
    String? ceo,
    String? cto,
    String? coo,
    String? ctoPropulsion,
    int? valuation,
    Headquarters? headquarters,
    CompanyLinks? links,
    String? summary,
  }) {
    return Company(
      name: name ?? this.name,
      founder: founder ?? this.founder,
      founded: founded ?? this.founded,
      employees: employees ?? this.employees,
      vehicles: vehicles ?? this.vehicles,
      launchSites: launchSites ?? this.launchSites,
      testSites: testSites ?? this.testSites,
      ceo: ceo ?? this.ceo,
      cto: cto ?? this.cto,
      coo: coo ?? this.coo,
      ctoPropulsion: ctoPropulsion ?? this.ctoPropulsion,
      valuation: valuation ?? this.valuation,
      headquarters: headquarters ?? this.headquarters,
      links: links ?? this.links,
      summary: summary ?? this.summary,
    );
  }
}

class Headquarters extends Equatable {
  final String address;
  final String city;
  final String state;

  const Headquarters({
    required this.address,
    required this.city,
    required this.state,
  });

  @override
  List<Object?> get props => [address, city, state];
}

class CompanyLinks extends Equatable {
  final String website;
  final String flickr;
  final String twitter;
  final String elonTwitter;

  const CompanyLinks({
    required this.website,
    required this.flickr,
    required this.twitter,
    required this.elonTwitter,
  });

  @override
  List<Object?> get props => [website, flickr, twitter, elonTwitter];
}
