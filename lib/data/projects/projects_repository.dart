import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/data/projects/network/projects_rest_client.dart';
import 'package:charity_game/utils/either.dart';
import 'package:http/http.dart';

class ProjectsRepository {
  final ProjectsRestClient restClient = ProjectsRestClient(Client());
  List<FeaturedProject> featuredProjectsCache;

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
//
//  Future<List<FeaturedProject>> getFeaturedProjects([int count = 5]) async {
//    return List.unmodifiable([
//      FeaturedProject(
//          title: "Help Dogs Save Cats",
//          imageUrl: "https://www.globalgiving.org/pfil/2578/pict_large.jpg"),
//      FeaturedProject(
//          title: "Sustainable Incomes for 3945 Young Organic Farmers",
//          imageUrl: "https://www.globalgiving.org/pfil/6265/pict_grid7.jpg"),
//      FeaturedProject(
//          title: "Reconnect the Atlantic Forest with 20.000 Trees",
//          imageUrl: "https://www.globalgiving.org/pfil/24458/pict_grid7.jpg"),
//      FeaturedProject(
//          title: "Change the lives of 100 Mayan Families",
//          imageUrl: "https://www.globalgiving.org/pfil/14647/pict_grid7.jpg"),
//      FeaturedProject(
//          title: "Bring Global Education To 100 In-Need Schools",
//          imageUrl: "https://www.globalgiving.org/pfil/23478/pict_grid7.jpg"),
//    ]);
//  }
}
