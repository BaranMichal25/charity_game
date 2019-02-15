import 'package:charity_game/main/main_page.dart';
import 'package:flutter/material.dart';

class CharityGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(title: 'Charity Game'),
    );
  }
}
