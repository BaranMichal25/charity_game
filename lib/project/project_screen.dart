import 'package:charity_game/data/projects/featured_project.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  final FeaturedProject project;

  ProjectScreen({this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Hero(
          tag: project.imageUrl,
          child: Image.network(project.imageUrl),
        ),
      ],
    );
  }
}
