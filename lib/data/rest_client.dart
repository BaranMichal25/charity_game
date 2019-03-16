import 'dart:io';

import 'package:charity_game/data/global_giving_api_key.dart';
import 'package:charity_game/utils/either.dart';
import 'package:http/http.dart';

abstract class RestClient {
  final Client httpClient;
  final Headers headers = Headers();

  RestClient(this.httpClient);

  String api(String endpoint) =>
      "https://api.globalgiving.org/api/public/projectservice/$endpoint?api_key=$api_key";

  Either<String, T> mapResponse<T>(
    Response response,
    T Function(String body) mapper,
  ) {
    if (response.statusCode == HttpStatus.ok) {
      // || response.statusCode == HttpStatus.noContent
      return Either.right(mapper(response.body));
    } else {
      return Either.left(response.toString());
    }
  }
}

class Headers {
  Map<String, String> _headers = Map();

  Headers get withAcceptJson {
    _headers['Accept'] = 'application/json';
    return this;
  }

  Map<String, String> asMap() {
    return Map.from(_headers);
  }
}
