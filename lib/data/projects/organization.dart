import 'package:meta/meta.dart';

class Organization {
  final int id;
  final String name;
  final String url;
  final String logoUrl;
  final String mission;
  final int totalProjects;
  final int activeProjects;

  Organization({
    @required this.id,
    @required this.name,
    @required this.url,
    @required this.logoUrl,
    @required this.mission,
    @required this.totalProjects,
    @required this.activeProjects,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Organization &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          url == other.url &&
          logoUrl == other.logoUrl &&
          mission == other.mission &&
          totalProjects == other.totalProjects &&
          activeProjects == other.activeProjects;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      url.hashCode ^
      logoUrl.hashCode ^
      mission.hashCode ^
      totalProjects.hashCode ^
      activeProjects.hashCode;

  @override
  String toString() {
    return 'Organization{id: $id, name: $name, url: $url, logoUrl: $logoUrl, '
        'mission: $mission, totalProjects: $totalProjects, '
        'activeProjects: $activeProjects}';
  }
}
