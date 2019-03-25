import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/utils/resource.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class FeaturedProjectsGrid extends StatelessWidget {
  final Resource<List<FeaturedProject>> resource;

  FeaturedProjectsGrid({this.resource});

  @override
  Widget build(BuildContext context) {
    switch (resource.status) {
      case Status.LOADING:
        final tiles = [
          _buildLoadingTile(),
          _buildLoadingTile(),
          _buildLoadingTile(),
          _buildLoadingTile(),
          _buildLoadingTile(),
        ];
        return _buildGrid(tiles);
        break;
      case Status.SUCCESS:
        final projects = resource.data;
        final tiles = [
          _buildDataTile(projects[0]),
          _buildDataTile(projects[1]),
          _buildDataTile(projects[2]),
          _buildDataTile(projects[3]),
          _buildDataTile(projects[4]),
        ];
        return _buildGrid(tiles);
        break;
      case Status.ERROR:
        return Text(resource.message);
        break;
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
                child: Image.asset(path,
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
                highlightColor: Colors.white,
                child: Text(
                  "Loading projects...",
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
final path = 'assets/images/placeholder8.jpg';
  Widget _buildDataTile(FeaturedProject project) {
    return SizedBox(
      height: 150.0,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage(path),
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
