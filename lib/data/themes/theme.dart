class Theme {
  final String id;
  final String name;

  Theme({this.id, this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Theme &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
