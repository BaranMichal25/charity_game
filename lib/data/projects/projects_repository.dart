import 'package:charity_game/data/projects/featured_project.dart';

class ProjectsRepository {
  Future<List<FeaturedProject>> getFeaturedProjects([int count = 5]) async {
    return Future.delayed(Duration(seconds: 1), () {
      return List.unmodifiable([
        FeaturedProject(
            title: "Give HIV+ mothers in Kenya a future",
            imageUrl: "https://www.globalgiving.org/pfil/32427/pict_grid7.jpg"),
        FeaturedProject(
            title: "Sustainable Incomes for 3945 Young Organic Farmers",
            imageUrl: "https://www.globalgiving.org/pfil/6265/pict_grid7.jpg"),
        FeaturedProject(
            title: "Reconnect the Atlantic Forest with 20.000 Trees",
            imageUrl: "https://www.globalgiving.org/pfil/24458/pict_grid7.jpg"),
        FeaturedProject(
            title: "Change the lives of 100 Mayan Families",
            imageUrl: "https://www.globalgiving.org/pfil/14647/pict_grid7.jpg"),
        FeaturedProject(
            title: "Bring Global Education To 100 In-Need Schools",
            imageUrl: "https://www.globalgiving.org/pfil/23478/pict_grid7.jpg"),
      ]);
    });
  }
}
