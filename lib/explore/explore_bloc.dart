import 'dart:async';

import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/data/projects/projects_repository.dart';
import 'package:charity_game/data/themes/theme.dart';
import 'package:charity_game/data/themes/themes_repository.dart';
import 'package:charity_game/utils/bloc.dart';
import 'package:charity_game/utils/resource.dart';
import 'package:rxdart/rxdart.dart';

class ExploreBloc extends Bloc {
  final ProjectsRepository projectsRepository;
  final ThemesRepository themesRepository;

  final _featuredProjects = PublishSubject<Resource<List<FeaturedProject>>>();
  final _themes = PublishSubject<Resource<List<Theme>>>();

  Stream<Resource<List<FeaturedProject>>> get featuredProjectsStream =>
      _featuredProjects.stream;

  Stream<Resource<List<Theme>>> get themesStream => _themes.stream;

  ExploreBloc({this.projectsRepository, this.themesRepository})
      : assert(projectsRepository != null, themesRepository != null);

  @override
  void dispose() {
    _featuredProjects.close();
    _themes.close();
  }

  Future<void> loadFeaturedProjects() async {
    final either = await projectsRepository.getFeaturedProjects();
    if (either.isLeft()) {
      _featuredProjects.add(Resource.error(message: either.left));
    } else {
      _featuredProjects.add(Resource.success(data: either.right));
    }
  }

  Future<void> loadThemes() async {
    final either = await themesRepository.getThemes();
    if (either.isLeft()) {
      _themes.add(Resource.error(message: either.left));
    } else {
      _themes.add(Resource.success(data: either.right));
    }
  }

  List<FeaturedProject> getFeaturedProjects() {
    return projectsRepository.featuredProjectsCache;
  }

  List<Theme> getThemes() {
    return themesRepository.themesCache;
  }
}
