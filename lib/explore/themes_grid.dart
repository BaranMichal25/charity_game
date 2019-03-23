import 'package:charity_game/data/themes/theme.dart' as GlobalGiving;
import 'package:charity_game/utils/resource.dart';
import 'package:flutter/material.dart';

class ThemesGrid extends StatelessWidget {
  final Resource<List<GlobalGiving.Theme>> resource;

  ThemesGrid({this.resource});

  @override
  Widget build(BuildContext context) {
    switch (resource.status) {
      case Status.LOADING:
        return Center(
          child: CircularProgressIndicator(),
        );
        break;
      case Status.SUCCESS:
        return Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: _buildThemesList(resource.data),
        );
        break;
      case Status.ERROR:
        return Text(resource.message);
        break;
    }
  }

  List<Widget> _buildThemesList(List<GlobalGiving.Theme> themes) {
    List<Widget> list = List();
    for (int i = 0; i < themes.length; i++) {
      list.add(Chip(label: Text(themes[i].name)));
    }
    list.insert(
        (themes.length + 1) ~/ 2,
        Chip(
          label: Text('Explore projects'),
          backgroundColor: Colors.amber,
        ));
    return list;
  }
}
