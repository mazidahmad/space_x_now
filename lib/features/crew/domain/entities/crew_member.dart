// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

enum CrewStatus {
  active,
  inactive,
  retired,
  unknown,
}

class CrewMember extends Equatable {
  final String? name; // nullable - default: null
  final CrewStatus status; // required - enum
  final String? agency; // nullable - default: null
  final String? image; // nullable - default: null
  final String? wikipedia; // nullable - default: null
  final List<String> launches; // required - array of launch UUIDs
  final String id; // required - unique identifier

  const CrewMember({
    this.name,
    required this.status,
    this.agency,
    this.image,
    this.wikipedia,
    required this.launches,
    required this.id,
  });

  @override
  List<Object?> get props => [
        name,
        status,
        agency,
        image,
        wikipedia,
        launches,
        id,
      ];

  // Helper getters
  bool get isActive => status == CrewStatus.active;
  bool get isRetired => status == CrewStatus.retired;
  bool get hasImage => image != null && image!.isNotEmpty;
  bool get hasWikipedia => wikipedia != null && wikipedia!.isNotEmpty;
  bool get hasLaunches => launches.isNotEmpty;
  int get totalLaunches => launches.length;
  String get displayName => name ?? 'Unknown Crew Member';
  String get agencyName => agency ?? 'Unknown Agency';

  CrewMember copyWith({
    String? name,
    CrewStatus? status,
    String? agency,
    String? image,
    String? wikipedia,
    List<String>? launches,
    String? id,
  }) {
    return CrewMember(
      name: name ?? this.name,
      status: status ?? this.status,
      agency: agency ?? this.agency,
      image: image ?? this.image,
      wikipedia: wikipedia ?? this.wikipedia,
      launches: launches ?? this.launches,
      id: id ?? this.id,
    );
  }
}
