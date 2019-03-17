import 'dart:convert';

import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/data/projects/network/featured_projects_summary_dto.dart';
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
      final dto = FeaturedProjectsSummaryGGDto.fromJson(json.decode(jsonBody));
      return dto.projects.project
          .map((project) => FeaturedProject(
              title: project.title, imageUrl: _getLargeImageLink(project.imageLink)))
          .toList();
    });
  }

  String _getLargeImageLink(String imageLink) {
    return imageLink.substring(0, imageLink.length - 4) + "_grid7.jpg";
  }
}
