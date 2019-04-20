import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:charity_game/data/projects/project.dart';
import 'package:charity_game/utils/dimens.dart';
import 'package:charity_game/utils/moonicons.dart';
import 'package:charity_game/utils/strings.dart';
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
    _projectBloc.loadProject(widget.project.id);
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
      children: [
        _buildImageGallery(),
        _buildProjectDetails(),
      ],
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
        return Image.network(
          links[index],
          fit: BoxFit.cover,
          width: 1000.0,
        );
      },
    );
return xd(images);
    return CarouselSlider(
      items: images,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
    );
  }

  Widget _buildProjectDetails() {
    return StreamBuilder<Resource<Project>>(
        initialData: Resource.loading(),
        stream: _projectBloc.projectStream,
        builder: (_, AsyncSnapshot<Resource<Project>> snapshot) {
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
              final project = resource.data;
              return Container(
                margin: const EdgeInsets.all(Dimens.defaultSpacing),
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.defaultSpacing),
                  child: Column(
                    children: [
                      _buildOrganizationRow(project),
                      _buildThemeAndCountryRow(project),
                    ],
                  ),
                ),
              );
            //return Text(resource.data.country);
            case Status.ERROR:
              return Text(resource.message);
          }
        });
  }

  Widget _buildOrganizationRow(Project project) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '${Strings.by} ',
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: project.organization.name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Styles.linkColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeAndCountryRow(Project project) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.defaultSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconText(MoonIcons.themes, project.themeName),
          _buildIconText(Icons.public, project.country),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: Dimens.halfDefaultSpacing),
          child: Text(title),
        ),
      ],
    );
  }

  Widget xd(List<Widget> images) {
    return CarouselWithIndicator(images: images);
  }
}

class CarouselWithIndicator extends StatefulWidget {
  final List<Widget> images;

  CarouselWithIndicator({this.images});

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.images,
          aspectRatio: 2.0,

          viewportFraction: 1.0,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(widget.images.length, (index) => lol(index)),
          ),
        )
      ],
    );
  }

  Widget lol(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _current == index
              ? Color.fromRGBO(0, 0, 0, 0.9)
              : Color.fromRGBO(0, 0, 0, 0.4)),
    );
  }
}
