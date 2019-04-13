import 'package:meta/meta.dart';

class FeaturedProject {
  final int id;
  final String title;
  final String imageUrl;

  FeaturedProject({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeaturedProject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ imageUrl.hashCode;
}
