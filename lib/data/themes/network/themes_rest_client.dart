import 'dart:async';
import 'dart:convert';

import 'package:charity_game/data/rest_client.dart';
import 'package:charity_game/data/themes/network/themes_dto.dart';
import 'package:charity_game/data/themes/theme.dart';
import 'package:charity_game/utils/either.dart';
import 'package:http/http.dart';

class ThemesRestClient extends RestClient {
  ThemesRestClient(Client httpClient) : super(httpClient);

  Future<Either<String, List<Theme>>> getThemes() async {
    final String url = api('themes');

    String encodedUrl = Uri.encodeFull(url);
    final response = await httpClient.get(
      encodedUrl,
      headers: headers.withAcceptJson.asMap(),
    );

    return mapResponse(response, (String jsonBody) {
      final dto = ThemesGGDto.fromJson(json.decode(jsonBody));
      return dto.themes.theme
          .map((theme) => Theme(id: theme.id, name: theme.name))
          .toList();
    });
  }
}
