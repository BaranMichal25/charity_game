import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/project/project_screen.dart';
import 'package:charity_game/utils/resource.dart';
import 'package:charity_game/utils/strings.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class FeaturedProjectsGrid extends StatelessWidget {
  final Resource<List<FeaturedProject>> resource;

  FeaturedProjectsGrid({this.resource});

  @override
  Widget build(BuildContext context) {
    switch (resource.status) {
      case Status.LOADING:
        final tiles = List.generate(5, (_) => _buildLoadingTile());
        return _buildGrid(tiles);
      case Status.SUCCESS:
        final projects = resource.data;
        final tiles =
            List.generate(5, (i) => _buildDataTile(projects[i], context));
        return _buildGrid(tiles);
      case Status.ERROR:
        return Text(resource.message);
    }
  }

  Widget _buildGrid(List<Widget> children) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: children[0],
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 2.0, 2.0),
              child: children[1],
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 0.0, 4.0, 2.0),
              child: children[2],
            )),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 2.0, 2.0, 2.0),
              child: children[3],
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 2.0, 4.0, 2.0),
              child: children[4],
            )),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingTile() {
    return SizedBox(
      height: 150.0,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  'assets/images/placeholder.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Shimmer.fromColors(
                baseColor: Colors.black38,
                highlightColor: Colors.black,
                child: Text(
                  Strings.loading_projects,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataTile(FeaturedProject project, BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => _openProjectScreen(project, context),
        child: SizedBox(
          height: 150.0,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/placeholder.jpg'),
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
        ),
      ),
    );
  }

  _openProjectScreen(FeaturedProject project, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProjectScreen(project: project)),
    );
  }
}
