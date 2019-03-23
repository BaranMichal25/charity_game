import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/utils/resource.dart';
import 'package:flutter/material.dart';

class FeaturedProjectsGrid extends StatelessWidget {
  final Resource<List<FeaturedProject>> resource;

  FeaturedProjectsGrid({this.resource});

  @override
  Widget build(BuildContext context) {
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
        break;
      case Status.ERROR:
        return Text(resource.message);
        break;
    }
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
}
