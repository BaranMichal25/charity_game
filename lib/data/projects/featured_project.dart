class FeaturedProject {
  final String title;
  final String imageUrl;

  FeaturedProject({this.title, this.imageUrl});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeaturedProject &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => title.hashCode ^ imageUrl.hashCode;
}
