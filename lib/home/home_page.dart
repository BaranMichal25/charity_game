import 'package:charity_game/utils/strings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Strings.dashboard),
    PlaceholderWidget(Strings.explore),
    PlaceholderWidget(Strings.history),
    PlaceholderWidget(Strings.stats),
    PlaceholderWidget(Strings.more)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _children[_currentIndex],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text(Strings.dashboard),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.category),
            title: new Text(Strings.explore),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.history),
            title: new Text(Strings.history),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.graphic_eq),
            title: new Text(Strings.stats),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.more_horiz),
            title: new Text(Strings.more),
          )
        ]);
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String title;

  PlaceholderWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text(title, style: new TextStyle(fontSize: 40)),
    ));
  }
}
