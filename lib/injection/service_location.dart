import 'package:charity_game/data/projects/network/projects_rest_client.dart';
import 'package:charity_game/data/projects/projects_repository.dart';
import 'package:charity_game/data/themes/network/themes_rest_client.dart';
import 'package:charity_game/data/themes/themes_repository.dart';
import 'package:charity_game/explore/explore_bloc.dart';
import 'package:charity_game/project/project_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt sl = GetIt();

void setupServiceLocator() {
  sl.registerLazySingleton<http.Client>(() => http.Client());
  _registerRepositories();
  _registerBlocs();
}

void _registerRepositories() {
  sl.registerLazySingleton<ProjectsRepository>(() {
    return ProjectsRepository(
      restClient: ProjectsRestClient(sl.get<http.Client>()),
    );
  });
  sl.registerLazySingleton<ThemesRepository>(() {
    return ThemesRepository(
      restClient: ThemesRestClient(sl.get<http.Client>()),
    );
  });
}

void _registerBlocs() {
  sl.registerFactory<ExploreBloc>(() {
    return ExploreBloc(
      projectsRepository: sl.get<ProjectsRepository>(),
      themesRepository: sl.get<ThemesRepository>(),
    );
  });

  sl.registerFactory<ProjectBloc>(() {
    return ProjectBloc(
      projectsRepository: sl.get<ProjectsRepository>(),
    );
  });
}
