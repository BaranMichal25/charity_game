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
    return ListView(
      children: [
        _buildFeaturedProjectsGrid(),
      ],
    );
  }

  Widget _buildFeaturedProjectsGrid() {
    return FutureBuilder(
        future: _featuredProjects,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<FeaturedProject>> snapshot,
        ) {
          if (snapshot.hasData) {
            final projects = snapshot.data;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: _buildFeaturedProjectTile(projects[0]),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 2.0, 2.0),
                      child: _buildFeaturedProjectTile(projects[1]),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 4.0, 2.0),
                      child: _buildFeaturedProjectTile(projects[2]),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 2.0, 2.0, 2.0),
                      child: _buildFeaturedProjectTile(projects[3]),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 4.0, 2.0),
                      child: _buildFeaturedProjectTile(projects[4]),
                    )),
                  ],
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _buildFeaturedProjectTile(FeaturedProject project) {
    return Container(
      constraints: BoxConstraints.tightFor(
        height: 150.0,
      ),
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        image: DecorationImage(
          image: NetworkImage(project.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(
        project.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
