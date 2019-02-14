import 'package:charity_game/home/home_page.dart';
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
      home: HomePage(title: 'Charity Game'),
    );
  }
}
