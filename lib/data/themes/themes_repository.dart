import 'dart:async';

import 'package:charity_game/data/themes/network/themes_rest_client.dart';
import 'package:charity_game/data/themes/theme.dart';
import 'package:charity_game/utils/either.dart';

class ThemesRepository {
  final ThemesRestClient restClient;

  List<Theme> themesCache;

  ThemesRepository({this.restClient});

  Future<Either<String, List<Theme>>> getThemes() async {
    if (themesCache == null) {
      final either = await restClient.getThemes();
      if (either.isRight()) {
        themesCache = either.right;
      } else {
        return either;
      }
    }

    return Either.right(themesCache);
  }
}
