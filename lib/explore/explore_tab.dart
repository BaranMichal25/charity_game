import 'package:charity_game/data/projects/featured_project.dart';
import 'package:charity_game/data/projects/projects_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExploreState();
}

class _ExploreState extends State<ExploreTab> {
  ProjectsRepository _repository = ProjectsRepository();
  Future<List<FeaturedProject>> _featuredProjects;

  @override
  void initState() {
    super.initState();
    _featuredProjects = _repository.getFeaturedProjects();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _featuredProjects,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<FeaturedProject>> snapshot,
        ) {
          if (snapshot.hasData) {
            final projects = snapshot.data;

            List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
              const StaggeredTile.count(2, 1),
              const StaggeredTile.count(1, 1),
              const StaggeredTile.count(1, 1),
              const StaggeredTile.count(1, 1),
              const StaggeredTile.count(1, 1),
            ];

            return StaggeredGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                padding: EdgeInsets.all(4.0),
                staggeredTiles: _staggeredTiles,
                children: List.generate(
                  5,
                  (int index) {
                    return _buildFeaturedProjectTile(projects[index]);
                  },
                ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _buildFeaturedProjectTile(FeaturedProject project) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 200.0,
      ),
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(project.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(
        project.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
