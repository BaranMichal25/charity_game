import 'package:charity_game/home/donated_card.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return DonatedCard();
  }
}
