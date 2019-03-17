import 'package:charity_game/data/themes/network/themes_dto.dart';

class FeaturedProjectsSummaryGGDto {
  ProjectsDto projects;

  FeaturedProjectsSummaryGGDto({this.projects});

  FeaturedProjectsSummaryGGDto.fromJson(Map<String, dynamic> json) {
    projects = json['projects'] != null
        ? ProjectsDto.fromJson(json['projects'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.projects != null) {
      data['projects'] = this.projects.toJson();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeaturedProjectsSummaryGGDto &&
          runtimeType == other.runtimeType &&
          projects == other.projects;

  @override
  int get hashCode => projects.hashCode;
}

class ProjectsDto {
  List<ProjectDto> project;
  int numberFound;

  ProjectsDto({this.project, this.numberFound});

  ProjectsDto.fromJson(Map<String, dynamic> json) {
    if (json['project'] != null) {
      project = List<ProjectDto>();
      json['project'].forEach((v) {
        project.add(ProjectDto.fromJson(v));
      });
    }
    numberFound = json['numberFound'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.project != null) {
      data['project'] = this.project.map((v) => v.toJson()).toList();
    }
    data['numberFound'] = this.numberFound;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectsDto &&
          runtimeType == other.runtimeType &&
          project == other.project &&
          numberFound == other.numberFound;

  @override
  int get hashCode => project.hashCode ^ numberFound.hashCode;
}

class ProjectDto {
  int id;
  OrganizationDto organization;
  bool active;
  String title;
  String summary;
  String themeName;
  String country;
  String iso3166CountryCode;
  String status;
  String imageLink;
  DonationOptionsDto donationOptions;
  String type;

  ProjectDto(
      {this.id,
      this.organization,
      this.active,
      this.title,
      this.summary,
      this.themeName,
      this.country,
      this.iso3166CountryCode,
      this.status,
      this.imageLink,
      this.donationOptions,
      this.type});

  ProjectDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organization = json['organization'] != null
        ? OrganizationDto.fromJson(json['organization'])
        : null;
    active = json['active'];
    title = json['title'];
    summary = json['summary'];
    themeName = json['themeName'];
    country = json['country'];
    iso3166CountryCode = json['iso3166CountryCode'];
    status = json['status'];
    imageLink = json['imageLink'];
    donationOptions = json['donationOptions'] != null
        ? DonationOptionsDto.fromJson(json['donationOptions'])
        : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.organization != null) {
      data['organization'] = this.organization.toJson();
    }
    data['active'] = this.active;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['themeName'] = this.themeName;
    data['country'] = this.country;
    data['iso3166CountryCode'] = this.iso3166CountryCode;
    data['status'] = this.status;
    data['imageLink'] = this.imageLink;
    if (this.donationOptions != null) {
      data['donationOptions'] = this.donationOptions.toJson();
    }
    data['type'] = this.type;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          organization == other.organization &&
          active == other.active &&
          title == other.title &&
          summary == other.summary &&
          themeName == other.themeName &&
          country == other.country &&
          iso3166CountryCode == other.iso3166CountryCode &&
          status == other.status &&
          imageLink == other.imageLink &&
          donationOptions == other.donationOptions &&
          type == other.type;

  @override
  int get hashCode =>
      id.hashCode ^
      organization.hashCode ^
      active.hashCode ^
      title.hashCode ^
      summary.hashCode ^
      themeName.hashCode ^
      country.hashCode ^
      iso3166CountryCode.hashCode ^
      status.hashCode ^
      imageLink.hashCode ^
      donationOptions.hashCode ^
      type.hashCode;
}

class OrganizationDto {
  int id;
  int bridgeId;
  String name;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String postal;
  String iso3166CountryCode;
  String url;
  String logoUrl;
  String mission;
  int totalProjects;
  int activeProjects;
  ThemesDto themes;
  CountriesDto countries;
  String country;

  OrganizationDto(
      {this.id,
      this.bridgeId,
      this.name,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.state,
      this.postal,
      this.iso3166CountryCode,
      this.url,
      this.logoUrl,
      this.mission,
      this.totalProjects,
      this.activeProjects,
      this.themes,
      this.countries,
      this.country});

  OrganizationDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bridgeId = json['bridgeId'];
    name = json['name'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    city = json['city'];
    state = json['state'];
    postal = json['postal'];
    iso3166CountryCode = json['iso3166CountryCode'];
    url = json['url'];
    logoUrl = json['logoUrl'];
    mission = json['mission'];
    totalProjects = json['totalProjects'];
    activeProjects = json['activeProjects'];
    themes = json['themes'] != null ? ThemesDto.fromJson(json['themes']) : null;
    countries = json['countries'] != null
        ? CountriesDto.fromJson(json['countries'])
        : null;
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['bridgeId'] = this.bridgeId;
    data['name'] = this.name;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postal'] = this.postal;
    data['iso3166CountryCode'] = this.iso3166CountryCode;
    data['url'] = this.url;
    data['logoUrl'] = this.logoUrl;
    data['mission'] = this.mission;
    data['totalProjects'] = this.totalProjects;
    data['activeProjects'] = this.activeProjects;
    if (this.themes != null) {
      data['themes'] = this.themes.toJson();
    }
    if (this.countries != null) {
      data['countries'] = this.countries.toJson();
    }
    data['country'] = this.country;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          bridgeId == other.bridgeId &&
          name == other.name &&
          addressLine1 == other.addressLine1 &&
          addressLine2 == other.addressLine2 &&
          city == other.city &&
          state == other.state &&
          postal == other.postal &&
          iso3166CountryCode == other.iso3166CountryCode &&
          url == other.url &&
          logoUrl == other.logoUrl &&
          mission == other.mission &&
          totalProjects == other.totalProjects &&
          activeProjects == other.activeProjects &&
          themes == other.themes &&
          countries == other.countries &&
          country == other.country;

  @override
  int get hashCode =>
      id.hashCode ^
      bridgeId.hashCode ^
      name.hashCode ^
      addressLine1.hashCode ^
      addressLine2.hashCode ^
      city.hashCode ^
      state.hashCode ^
      postal.hashCode ^
      iso3166CountryCode.hashCode ^
      url.hashCode ^
      logoUrl.hashCode ^
      mission.hashCode ^
      totalProjects.hashCode ^
      activeProjects.hashCode ^
      themes.hashCode ^
      countries.hashCode ^
      country.hashCode;
}

class CountriesDto {
  List<CountryDto> country;

  CountriesDto({this.country});

  CountriesDto.fromJson(Map<String, dynamic> json) {
    if (json['country'] != null) {
      country = List<CountryDto>();
      json['country'].forEach((v) {
        country.add(CountryDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.country != null) {
      data['country'] = this.country.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountriesDto &&
          runtimeType == other.runtimeType &&
          country == other.country;

  @override
  int get hashCode => country.hashCode;
}

class CountryDto {
  String name;
  String iso3166CountryCode;

  CountryDto({this.name, this.iso3166CountryCode});

  CountryDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iso3166CountryCode = json['iso3166CountryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['iso3166CountryCode'] = this.iso3166CountryCode;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryDto &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          iso3166CountryCode == other.iso3166CountryCode;

  @override
  int get hashCode => name.hashCode ^ iso3166CountryCode.hashCode;
}

class DonationOptionsDto {
  List<DonationOptionDto> donationOption;

  DonationOptionsDto({this.donationOption});

  DonationOptionsDto.fromJson(Map<String, dynamic> json) {
    if (json['donationOption'] != null) {
      donationOption = List<DonationOptionDto>();
      json['donationOption'].forEach((v) {
        donationOption.add(DonationOptionDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.donationOption != null) {
      data['donationOption'] =
          this.donationOption.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DonationOptionsDto &&
          runtimeType == other.runtimeType &&
          donationOption == other.donationOption;

  @override
  int get hashCode => donationOption.hashCode;
}

class DonationOptionDto {
  int amount;
  String description;

  DonationOptionDto({this.amount, this.description});

  DonationOptionDto.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = this.amount;
    data['description'] = this.description;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DonationOptionDto &&
          runtimeType == other.runtimeType &&
          amount == other.amount &&
          description == other.description;

  @override
  int get hashCode => amount.hashCode ^ description.hashCode;
}
