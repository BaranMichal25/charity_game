import 'package:charity_game/charity_game_app.dart';
import 'package:charity_game/injection/service_location.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(CharityGameApp());
}
