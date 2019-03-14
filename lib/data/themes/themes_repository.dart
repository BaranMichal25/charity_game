import 'package:charity_game/data/themes/theme.dart';

class ThemesRepository {
  Future<List<Theme>> getThemes() async {
    return Future.delayed(Duration(seconds: 1), () {
      return List.unmodifiable([
        Theme(id: "animals", name: "Animals"),
        Theme(id: "children", name: "Children"),
        Theme(id: "climate", name: "Climate Change"),
        Theme(id: "democ", name: "Democracy and Governance"),
        Theme(id: "disaster", name: "Disaster Recovery"),
        Theme(id: "ecdev", name: "Economic Development"),
        Theme(id: "edu", name: "Education"),
        Theme(id: "env", name: "Environment"),
        Theme(id: "finance", name: "Microfinance"),
        Theme(id: "gender", name: "Women and Girls"),
        Theme(id: "health", name: "Health"),
      ]);
    });
  }
}
