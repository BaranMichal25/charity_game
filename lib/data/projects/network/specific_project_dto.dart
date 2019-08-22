import 'package:charity_game/data/projects/network/donation_options_dto.dart';

class SpecificProjectDto {
  SpecificProjectProjectDto project;

  SpecificProjectDto({this.project});

  SpecificProjectDto.fromJson(Map<String, dynamic> json) {
    project =
    json['project'] != null ? SpecificProjectProjectDto.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.project != null) {
      data['project'] = this.project.toJson();
    }
    return data;
  }
}

class SpecificProjectProjectDto {
  int id;
  SpecificProjectOrganizationDto organization;
  String title;
  String summary;
  String themeName;
  String country;
  String region;
  double goal;
  double funding;
  double remaining;
  int numberOfDonations;
  String need;
  String longTermImpact;
  String activities;
  String imageLink;
  DonationOptionsDto donationOptions;

  SpecificProjectProjectDto(
      {this.id,
        this.organization,
        this.title,
        this.summary,
        this.themeName,
        this.country,
        this.region,
        this.goal,
        this.funding,
        this.remaining,
        this.numberOfDonations,
        this.need,
        this.longTermImpact,
        this.activities,
        this.imageLink,
        this.donationOptions});

  SpecificProjectProjectDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organization = json['organization'] != null
        ? SpecificProjectOrganizationDto.fromJson(json['organization'])
        : null;
    title = json['title'];
    summary = json['summary'];
    themeName = json['themeName'];
    country = json['country'];
    region = json['region'];
    goal = json['goal'];
    funding = json['funding'];
    remaining = json['remaining'];
    numberOfDonations = json['numberOfDonations'];
    need = json['need'];
    longTermImpact = json['longTermImpact'];
    activities = json['activities'];
    imageLink = json['imageLink'];
    donationOptions = json['donationOptions'] != null
        ? DonationOptionsDto.fromJson(json['donationOptions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.organization != null) {
      data['organization'] = this.organization.toJson();
    }
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['themeName'] = this.themeName;
    data['country'] = this.country;
    data['region'] = this.region;
    data['goal'] = this.goal;
    data['funding'] = this.funding;
    data['remaining'] = this.remaining;
    data['numberOfDonations'] = this.numberOfDonations;
    data['need'] = this.need;
    data['longTermImpact'] = this.longTermImpact;
    data['activities'] = this.activities;
    data['imageLink'] = this.imageLink;
    if (this.donationOptions != null) {
      data['donationOptions'] = this.donationOptions.toJson();
    }
    return data;
  }
}

class SpecificProjectOrganizationDto {
  int id;
  String name;
  String url;
  String logoUrl;
  String mission;
  int totalProjects;
  int activeProjects;

  SpecificProjectOrganizationDto(
      {this.id,
        this.name,
        this.url,
        this.logoUrl,
        this.mission,
        this.totalProjects,
        this.activeProjects});

  SpecificProjectOrganizationDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    logoUrl = json['logoUrl'];
    mission = json['mission'];
    totalProjects = json['totalProjects'];
    activeProjects = json['activeProjects'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['logoUrl'] = this.logoUrl;
    data['mission'] = this.mission;
    data['totalProjects'] = this.totalProjects;
    data['activeProjects'] = this.activeProjects;
    return data;
  }
}