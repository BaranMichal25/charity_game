import 'dart:async';

import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/data/projects/network/projects_rest_client.dart';
import 'package:charity_game/utils/either.dart';

class ProjectsRepository {
  final ProjectsRestClient restClient;
  List<FeaturedProject> featuredProjectsCache;

  ProjectsRepository({this.restClient});

  Future<Either<String, List<FeaturedProject>>> getFeaturedProjects() async {
    if (featuredProjectsCache == null) {
      final either = await restClient.getFeaturedProjects();
      if (either.isRight()) {
        featuredProjectsCache = either.right;
      } else {
        return either;
      }
    }

    return Either.right(featuredProjectsCache);
  }
}
