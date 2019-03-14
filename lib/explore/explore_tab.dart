import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/data/projects/projects_repository.dart';
import 'package:charity_game/data/themes/themes_repository.dart';
import 'package:charity_game/data/themes/theme.dart' as GlobalGiving;
import 'package:flutter/material.dart';

class ExploreTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExploreState();
}

class _ExploreState extends State<ExploreTab> {
  ProjectsRepository _projectsRepository = ProjectsRepository();
  ThemesRepository _themesRepository = ThemesRepository();

  Future<List<FeaturedProject>> _featuredProjects;
  Future<List<GlobalGiving.Theme>> _themes;

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

  Widget _buildThemesGrid() {
    return FutureBuilder(
        future: _themes,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<GlobalGiving.Theme>> snapshot,
        ) {
          if (snapshot.hasData) {
            final themes = snapshot.data;
            return Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: _buildThemesList(themes),
            );
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
