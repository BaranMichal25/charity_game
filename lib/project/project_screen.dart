import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:charity_game/data/projects/project.dart';
import 'package:charity_game/utils/dimens.dart';
import 'package:charity_game/utils/moonicons.dart';
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
    return ListView(
      children: [
        _buildImageGallery(),
        _buildProjectDetails(),
        _buildProjectDescription(),
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
              return Padding(
                padding: const EdgeInsets.all(Dimens.defaultSpacing),
                child: Column(
                  children: [
                    _buildOrganizationRow(project),
                    SizedBox(height: Dimens.defaultSpacing),
                    _buildThemeAndCountryRow(project),
                  ],
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
        text: 'by ',
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: project.organization.name,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Styles.linkColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeAndCountryRow(Project project) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconText(MoonIcons.themes, project.themeName),
        _buildIconText(Icons.public, project.country),
      ],
    );
  }

  Widget _buildIconText(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: Dimens.oneThirdDefaultSpacing),
          child: Text(title,
              style: TextStyle(
                fontSize: 16.0,
              )),
        ),
      ],
    );
  }

  Widget _buildProjectDescription() {
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
                  child: SpinKitThreeBounce(color: Colors.blue[500]),
                ),
              );
            case Status.SUCCESS:
              final project = resource.data;
              return _buildDescriptionColumn(project);
            //return Text(resource.data.country);
            case Status.ERROR:
              return Text(resource.message);
          }
        });
  }

  Widget _buildDescriptionColumn(Project project) {
    final summary = _buildDescriptionCard('Summary', project.summary);
    final challenge = _buildDescriptionCard('Challenge', project.need);
    final activities = _buildDescriptionCard('Activities', project.activities);
    final longTermImpact =
        _buildDescriptionCard('Long-term impact', project.longTermImpact);

    return Padding(
      padding: const EdgeInsets.all(Dimens.defaultSpacing),
      child: Column(
        children: [summary, challenge, activities, longTermImpact],
      ),
    );
  }

  Widget _buildDescriptionCard(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Dimens.defaultSpacing,
            bottom: Dimens.defaultSpacing,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: Dimens.defaultSpacing,
          ),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}
