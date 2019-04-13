import 'dart:async';

import 'package:charity_game/data/projects/projects_repository.dart';
import 'package:charity_game/utils/bloc.dart';
import 'package:charity_game/utils/resource.dart';
import 'package:rxdart/rxdart.dart';

class ProjectBloc extends Bloc {
  final ProjectsRepository projectsRepository;

  final _imageGallery = PublishSubject<Resource<List<String>>>();

  Stream<Resource<List<String>>> get imageGalleryStream => _imageGallery.stream;

  ProjectBloc({this.projectsRepository}) : assert(projectsRepository != null);

  @override
  void dispose() {
    _imageGallery.close();
  }

  Future<void> loadImageGallery(int projectId) async {
    final either = await projectsRepository.getImageGallery(projectId);
    if (either.isLeft()) {
      _imageGallery.add(Resource.error(message: either.left));
    } else {
      _imageGallery.add(Resource.success(data: either.right));
    }
  }
}
