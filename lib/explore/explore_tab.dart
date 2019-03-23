import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/data/themes/theme.dart' as GlobalGiving;
import 'package:charity_game/explore/explore_bloc.dart';
import 'package:charity_game/injection/service_location.dart';
import 'package:charity_game/utils/resource.dart';
import 'package:flutter/material.dart';

class ExploreTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExploreState();
}

class _ExploreState extends State<ExploreTab> {
  ExploreBloc _exploreBloc;

  @override
  void initState() {
    super.initState();
    _exploreBloc = sl.get<ExploreBloc>();
    _exploreBloc.loadFeaturedProjects();
    _exploreBloc.loadThemes();
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
    return StreamBuilder<Resource<List<FeaturedProject>>>(
        initialData: Resource.loading(),
        stream: _exploreBloc.featuredProjects,
        builder: (_, AsyncSnapshot<Resource<List<FeaturedProject>>> snapshot) {
          if (snapshot.hasData) {
            final resource = snapshot.data;
            switch (resource.status) {
              case Status.LOADING:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case Status.SUCCESS:
                final projects = resource.data;
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
                          padding:
                              const EdgeInsets.fromLTRB(4.0, 0.0, 2.0, 2.0),
                          child: _buildFeaturedProjectTile(projects[1]),
                        )),
                        Expanded(
                            child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(2.0, 0.0, 4.0, 2.0),
                          child: _buildFeaturedProjectTile(projects[2]),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(4.0, 2.0, 2.0, 2.0),
                          child: _buildFeaturedProjectTile(projects[3]),
                        )),
                        Expanded(
                            child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(2.0, 2.0, 4.0, 2.0),
                          child: _buildFeaturedProjectTile(projects[4]),
                        )),
                      ],
                    ),
                  ],
                );
                break;
              case Status.ERROR:
                return Text(resource.message);
                break;
            }
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
    return StreamBuilder<Resource<List<GlobalGiving.Theme>>>(
        initialData: Resource.loading(),
        stream: _exploreBloc.themes,
        builder:
            (_, AsyncSnapshot<Resource<List<GlobalGiving.Theme>>> snapshot) {
          if (snapshot.hasData) {
            final resource = snapshot.data;
            switch (resource.status) {
              case Status.LOADING:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case Status.SUCCESS:
                return Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: _buildThemesList(resource.data),
                );
                break;
              case Status.ERROR:
                return Text(resource.message);
                break;
            }
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
