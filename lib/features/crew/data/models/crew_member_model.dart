import '../../domain/entities/crew_member.dart';

class CrewMemberModel extends CrewMember {
  const CrewMemberModel({
    super.name,
    required super.status,
    super.agency,
    super.image,
    super.wikipedia,
    required super.launches,
    required super.id,
  });

  factory CrewMemberModel.fromJson(Map<String, dynamic> json) {
    return CrewMemberModel(
      name: json['name'],
      status: _parseStatus(json['status']),
      agency: json['agency'],
      image: json['image'],
      wikipedia: json['wikipedia'],
      launches: List<String>.from(json['launches'] ?? []),
      id: json['id'] ?? '',
    );
  }

  static CrewStatus _parseStatus(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
        return CrewStatus.active;
      case 'inactive':
        return CrewStatus.inactive;
      case 'retired':
        return CrewStatus.retired;
      default:
        return CrewStatus.unknown;
    }
  }

  static String _statusToString(CrewStatus status) {
    switch (status) {
      case CrewStatus.active:
        return 'active';
      case CrewStatus.inactive:
        return 'inactive';
      case CrewStatus.retired:
        return 'retired';
      case CrewStatus.unknown:
        return 'unknown';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': _statusToString(status),
      'agency': agency,
      'image': image,
      'wikipedia': wikipedia,
      'launches': launches,
      'id': id,
    };
  }
}
