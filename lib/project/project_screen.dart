import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:charity_game/utils/styles.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/injection/service_location.dart';
import 'package:charity_game/project/project_bloc.dart';
import 'package:charity_game/utils/resource.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  final FeaturedProject project;

  ProjectScreen({this.project});

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  ProjectBloc _projectBloc;

  @override
  void initState() {
    super.initState();
    _projectBloc = sl.get<ProjectBloc>();
    _projectBloc.loadImageGallery(widget.project.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          widget.project.title,
          maxLines: 2,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [_buildImageGallery()],
    );
  }

  Widget _buildImageGallery() {
    return StreamBuilder<Resource<List<String>>>(
        initialData: Resource.loading(),
        stream: _projectBloc.imageGalleryStream,
        builder: (_, AsyncSnapshot<Resource<List<String>>> snapshot) {
          final resource = snapshot.data;

          switch (resource.status) {
            case Status.LOADING:
              return SizedBox(
                height: MediaQuery.of(context).size.width / 2.0,
                child: Center(
                  child: SpinKitThreeBounce(color: Styles.accentColor),
                ),
              );
            case Status.SUCCESS:
              return _buildImageCarousel(resource.data);
            case Status.ERROR:
              return SizedBox(
                height: MediaQuery.of(context).size.width / 2.0,
                child: Text(resource.message),
              );
          }
        });
  }

  Widget _buildImageCarousel(List<String> links) {
    final List<Widget> images = List.generate(
      links.length,
      (int index) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              links[index],
              fit: BoxFit.cover,
              width: 1000.0,
            ),
          ),
        );
      },
    );

    return CarouselSlider(
      items: images,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
    );
  }
}
