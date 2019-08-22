class ImageGalleryDto {
  ImagesDto images;

  ImageGalleryDto({this.images});

  ImageGalleryDto.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null ? ImagesDto.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageGalleryDto &&
          runtimeType == other.runtimeType &&
          images == other.images;

  @override
  int get hashCode => images.hashCode;

  @override
  String toString() {
    return 'ImageGalleryDto{images: $images}';
  }
}

class ImagesDto {
  List<ImageDto> image;

  ImagesDto({this.image});

  ImagesDto.fromJson(Map<String, dynamic> json) {
    if (json['image'] != null) {
      image = List<ImageDto>();
      json['image'].forEach((v) {
        image.add(ImageDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImagesDto &&
          runtimeType == other.runtimeType &&
          image == other.image;

  @override
  int get hashCode => image.hashCode;

  @override
  String toString() {
    return 'ImagesDto{image: $image}';
  }
}

class ImageDto {
  String title;
  int id;
  List<ImageLinkDto> imagelink;

  ImageDto({this.title, this.id, this.imagelink});

  ImageDto.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    if (json['imagelink'] != null) {
      imagelink = List<ImageLinkDto>();
      json['imagelink'].forEach((v) {
        imagelink.add(ImageLinkDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    if (this.imagelink != null) {
      data['imagelink'] = this.imagelink.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageDto &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          id == other.id &&
          imagelink == other.imagelink;

  @override
  int get hashCode => title.hashCode ^ id.hashCode ^ imagelink.hashCode;

  @override
  String toString() {
    return 'ImageDto{title: $title, id: $id, imagelink: $imagelink}';
  }
}

class ImageLinkDto {
  String url;
  String size;

  ImageLinkDto({this.url, this.size});

  ImageLinkDto.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this.url;
    data['size'] = this.size;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageLinkDto &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          size == other.size;

  @override
  int get hashCode => url.hashCode ^ size.hashCode;

  @override
  String toString() {
    return 'ImageLinkDto{url: $url, size: $size}';
  }
}
