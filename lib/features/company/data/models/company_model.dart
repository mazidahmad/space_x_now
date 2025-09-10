import 'dart:convert';

import '../../domain/entities/company.dart';

class CompanyModel extends Company {
  const CompanyModel({
    required String name,
    required String founder,
    required int founded,
    required int employees,
    required int vehicles,
    required int launchSites,
    required int testSites,
    required String ceo,
    required String cto,
    required String coo,
    required String ctoPropulsion,
    required int valuation,
    required HeadquartersModel headquarters,
    required CompanyLinksModel links,
    required String summary,
  }) : super(
          name: name,
          founder: founder,
          founded: founded,
          employees: employees,
          vehicles: vehicles,
          launchSites: launchSites,
          testSites: testSites,
          ceo: ceo,
          cto: cto,
          coo: coo,
          ctoPropulsion: ctoPropulsion,
          valuation: valuation,
          headquarters: headquarters,
          links: links,
          summary: summary,
        );

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'] ?? '',
      founder: json['founder'] ?? '',
      founded: json['founded'] ?? 0,
      employees: json['employees'] ?? 0,
      vehicles: json['vehicles'] ?? 0,
      launchSites: json['launch_sites'] ?? 0,
      testSites: json['test_sites'] ?? 0,
      ceo: json['ceo'] ?? '',
      cto: json['cto'] ?? '',
      coo: json['coo'] ?? '',
      ctoPropulsion: json['cto_propulsion'] ?? '',
      valuation: json['valuation'] ?? 0,
      headquarters: HeadquartersModel.fromJson(json['headquarters'] ?? {}),
      links: CompanyLinksModel.fromJson(json['links'] ?? {}),
      summary: json['summary'] ?? '',
    );
  }

  factory CompanyModel.fromJsonString(String str) =>
      CompanyModel.fromJson(json.decode(str));

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'founder': founder,
      'founded': founded,
      'employees': employees,
      'vehicles': vehicles,
      'launch_sites': launchSites,
      'test_sites': testSites,
      'ceo': ceo,
      'cto': cto,
      'coo': coo,
      'cto_propulsion': ctoPropulsion,
      'valuation': valuation,
      'headquarters': (headquarters as HeadquartersModel).toJson(),
      'links': (links as CompanyLinksModel).toJson(),
      'summary': summary,
    };
  }

  String toJsonString() => json.encode(toJson());
}

class HeadquartersModel extends Headquarters {
  const HeadquartersModel({
    required String address,
    required String city,
    required String state,
  }) : super(
          address: address,
          city: city,
          state: state,
        );

  factory HeadquartersModel.fromJson(Map<String, dynamic> json) {
    return HeadquartersModel(
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'city': city,
      'state': state,
    };
  }
}

class CompanyLinksModel extends CompanyLinks {
  const CompanyLinksModel({
    required String website,
    required String flickr,
    required String twitter,
    required String elonTwitter,
  }) : super(
          website: website,
          flickr: flickr,
          twitter: twitter,
          elonTwitter: elonTwitter,
        );

  factory CompanyLinksModel.fromJson(Map<String, dynamic> json) {
    return CompanyLinksModel(
      website: json['website'] ?? '',
      flickr: json['flickr'] ?? '',
      twitter: json['twitter'] ?? '',
      elonTwitter: json['elon_twitter'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'website': website,
      'flickr': flickr,
      'twitter': twitter,
      'elon_twitter': elonTwitter,
    };
  }
}
