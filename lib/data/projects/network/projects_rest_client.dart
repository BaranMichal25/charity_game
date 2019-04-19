import 'dart:async';
import 'dart:convert';

import 'package:charity_game/data/projects/donation_option.dart';
import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/data/projects/network/donation_options_dto.dart';
import 'package:charity_game/data/projects/network/featured_projects_summary_dto.dart';
import 'package:charity_game/data/projects/network/image_gallery_dto.dart';
import 'package:charity_game/data/projects/network/specific_project_dto.dart';
import 'package:charity_game/data/projects/organization.dart';
import 'package:charity_game/data/projects/project.dart';
import 'package:charity_game/data/rest_client.dart';
import 'package:charity_game/utils/either.dart';
import 'package:http/http.dart';

class ProjectsRestClient extends RestClient {
  ProjectsRestClient(Client httpClient) : super(httpClient);

  Future<Either<String, List<FeaturedProject>>> getFeaturedProjects() async {
    final String url = api('featured/projects/summary');

    String encodedUrl = Uri.encodeFull(url);
    final response = await httpClient.get(
      encodedUrl,
      headers: headers.withAcceptJson.asMap(),
    );

    return mapResponse(response, (String jsonBody) {
      final dto = FeaturedProjectsSummaryDto.fromJson(json.decode(jsonBody));
      return dto.projects.project
          .map((project) => FeaturedProject(
              id: project.id,
              title: project.title,
              imageUrl: _appendLargeImageLink(project.imageLink)))
          .toList();
    });
  }

  Future<Either<String, List<String>>> getImageGallery(int projectId) async {
    final String url = api('projects/$projectId/imagegallery');

    String encodedUrl = Uri.encodeFull(url);
    final response = await httpClient.get(
      encodedUrl,
      headers: headers.withAcceptJson.asMap(),
    );

    return mapResponse(response, (String jsonBody) {
      final dto = ImageGalleryDto.fromJson(json.decode(jsonBody));

      return dto.images.image
          .map((image) => _getLargeImageLink(image.imagelink))
          .toList();
    });
  }

  Future<Either<String, Project>> getProject(int projectId) async {
    final String url = api('projects/$projectId');

    String encodedUrl = Uri.encodeFull(url);
    final response = await httpClient.get(
      encodedUrl,
      headers: headers.withAcceptJson.asMap(),
    );

    return mapResponse(response, (String jsonBody) {
      final dto = SpecificProjectDto.fromJson(json.decode(jsonBody));
      return _convertDtoToProject(dto.project);
    });
  }

  String _appendLargeImageLink(String imageLink) {
    return imageLink.substring(0, imageLink.length - 4) + "_grid7.jpg";
  }

  String _getLargeImageLink(List<ImageLinkDto> dtos) {
    return dtos.firstWhere((dto) => dto.size == "large").url;
  }

  Project _convertDtoToProject(SpecificProjectProjectDto dto) {
    return Project(
      id: dto.id,
      organization: _convertDtoToOrganization(dto.organization),
      title: dto.title,
      summary: dto.summary,
      themeName: dto.themeName,
      country: dto.country,
      region: dto.region,
      goal: dto.goal,
      funding: dto.funding,
      remaining: dto.remaining,
      numberOfDonations: dto.numberOfDonations,
      need: dto.need,
      longTermImpact: dto.longTermImpact,
      activities: dto.activities,
      donationOptions: convertDtoToDonationOptions(dto.donationOptions),
    );
  }

  Organization _convertDtoToOrganization(SpecificProjectOrganizationDto dto) {
    return Organization(
      id: dto.id,
      name: dto.name,
      url: dto.url,
      logoUrl: dto.logoUrl,
      mission: dto.mission,
      totalProjects: dto.totalProjects,
      activeProjects: dto.activeProjects,
    );
  }

  List<DonationOption> convertDtoToDonationOptions(DonationOptionsDto dto) {
    return dto.donationOption
        .map((option) => DonationOption(
              amount: option.amount,
              description: option.description,
            ))
        .toList();
  }
}
