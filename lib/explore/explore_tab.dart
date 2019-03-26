import 'package:charity_game/data/themes/theme.dart' as GlobalGiving;
import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/explore/explore_bloc.dart';
import 'package:charity_game/explore/featured_projects_grid.dart';
import 'package:charity_game/explore/themes_grid.dart';
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
    final featuredProjects = _exploreBloc.getFeaturedProjects();
    if (featuredProjects != null) {
      return FeaturedProjectsGrid(
          resource: Resource.success(data: featuredProjects));
    } else {
      return StreamBuilder<Resource<List<FeaturedProject>>>(
          initialData: Resource.loading(),
          stream: _exploreBloc.featuredProjectsStream,
          builder:
              (_, AsyncSnapshot<Resource<List<FeaturedProject>>> snapshot) {
            return FeaturedProjectsGrid(resource: snapshot.data);
          });
    }
  }

  Widget _buildThemesGrid() {
    final themes = _exploreBloc.getThemes();
    if (themes != null) {
      return ThemesGrid(resource: Resource.success(data: themes));
    } else {
      return StreamBuilder<Resource<List<GlobalGiving.Theme>>>(
          initialData: Resource.loading(),
          stream: _exploreBloc.themesStream,
          builder:
              (_, AsyncSnapshot<Resource<List<GlobalGiving.Theme>>> snapshot) {
            return ThemesGrid(resource: snapshot.data);
          });
    }
  }
}
