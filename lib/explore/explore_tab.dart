import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/data/projects/projects_repository.dart';
import 'package:flutter/material.dart';

class ExploreTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExploreState();
}

class _ExploreState extends State<ExploreTab> {
  ProjectsRepository _repository = ProjectsRepository();
  Future<List<FeaturedProject>> _featuredProjects;

  @override
  void initState() {
    super.initState();
    _featuredProjects = _repository.getFeaturedProjects();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _featuredProjects,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<FeaturedProject>> snapshot,
        ) {
          if (snapshot.hasData) {
            final projects = snapshot.data;

            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(6, (int index) {
                return Container(
                  constraints: BoxConstraints.expand(
                    height: 200.0,
                  ),
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.all(3.0),
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(projects[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    projects[index].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                );
              }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
