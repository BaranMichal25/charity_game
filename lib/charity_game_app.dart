import 'package:charity_game/main/main_page.dart';
import 'package:charity_game/utils/strings.dart';
import 'package:flutter/material.dart';

class CharityGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.charity_game,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(title: 'Charity Game'),
    );
  }
}
