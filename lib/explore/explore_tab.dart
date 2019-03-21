import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/data/projects/projects_repository.dart';
import 'package:charity_game/data/themes/themes_repository.dart';
import 'package:charity_game/data/themes/theme.dart' as GlobalGiving;
import 'package:charity_game/injection/service_location.dart';
import 'package:charity_game/utils/either.dart';
import 'package:flutter/material.dart';

class ExploreTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExploreState();
}

class _ExploreState extends State<ExploreTab> {
  ProjectsRepository _projectsRepository = sl.get<ProjectsRepository>();
  ThemesRepository _themesRepository = sl.get<ThemesRepository>();

  Future<Either<String, List<FeaturedProject>>> _featuredProjects;
  Future<Either<String, List<GlobalGiving.Theme>>> _themes;

  @override
  void initState() {
    super.initState();
    _featuredProjects = _projectsRepository.getFeaturedProjects();
    _themes = _themesRepository.getThemes();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildFeaturedProjectsGrid(),
        _buildThemesGrid(),
      ],
    );
  }

  Widget _buildFeaturedProjectsGrid() {
    return FutureBuilder(
        future: _featuredProjects,
        builder: (
          BuildContext context,
          AsyncSnapshot<Either<String, List<FeaturedProject>>> snapshot,
        ) {
          if (snapshot.hasData) {
            final either = snapshot.data;
            if (either.isLeft()) {
              return Text(either.left);
            } else {
              final projects = either.right;
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
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _buildFeaturedProjectTile(FeaturedProject project) {
    return SizedBox(
      height: 150.0,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/images/placeholder.png'),
                image: NetworkImage(project.imageUrl),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                project.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  shadows: [
                    Shadow(
                      blurRadius: 8.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemesGrid() {
    return FutureBuilder(
        future: _themes,
        builder: (
          BuildContext context,
          AsyncSnapshot<Either<String, List<GlobalGiving.Theme>>> snapshot,
        ) {
          if (snapshot.hasData) {
            final either = snapshot.data;
            if (either.isLeft()) {
              return Text(either.left);
            } else {
              return Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: _buildThemesList(either.right),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  List<Widget> _buildThemesList(List<GlobalGiving.Theme> themes) {
    List<Widget> list = List();
    for (int i = 0; i < themes.length; i++) {
      list.add(Chip(label: Text(themes[i].name)));
    }
    list.insert(
        (themes.length + 1) ~/ 2,
        Chip(
          label: Text('Explore projects'),
          backgroundColor: Colors.amber,
        ));
    return list;
  }
}
