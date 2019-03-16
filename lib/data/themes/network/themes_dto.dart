class ThemesGGDto {
  ThemesDto themes;

  ThemesGGDto({this.themes});

  ThemesGGDto.fromJson(Map<String, dynamic> json) {
    themes = json['themes'] != null ? ThemesDto.fromJson(json['themes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.themes != null) {
      data['themes'] = this.themes.toJson();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemesGGDto &&
          runtimeType == other.runtimeType &&
          themes == other.themes;

  @override
  int get hashCode => themes.hashCode;

  @override
  String toString() {
    return 'ThemesGGDto{themes: $themes}';
  }
}

class ThemesDto {
  List<ThemeDto> theme;

  ThemesDto({this.theme});

  ThemesDto.fromJson(Map<String, dynamic> json) {
    if (json['theme'] != null) {
      theme = List<ThemeDto>();
      json['theme'].forEach((v) {
        theme.add(ThemeDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.theme != null) {
      data['theme'] = this.theme.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemesDto &&
          runtimeType == other.runtimeType &&
          theme == other.theme;

  @override
  int get hashCode => theme.hashCode;

  @override
  String toString() {
    return 'ThemesDto{theme: $theme}';
  }
}

class ThemeDto {
  String id;
  String name;

  ThemeDto({this.id, this.name});

  ThemeDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'ThemeDto{id: $id, name: $name}';
  }
}
