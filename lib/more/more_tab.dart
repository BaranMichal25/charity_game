import 'package:charity_game/utils/strings.dart';
import 'package:flutter/material.dart';

class MoreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text(Strings.account),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text(Strings.notifications),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(Strings.invite_a_friend),
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text(Strings.help),
        ),
      ],
    );
  }
}
