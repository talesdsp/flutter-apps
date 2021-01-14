import 'dart:convert';

import 'package:pokedex/services/cache.dart';

class HttpProvider {
  static Future<String> getData(String url, Map<String, String> headers) async {
    var file =
        await CustomCacheManager.instance.getSingleFile(url, headers: headers);
    if (file != null && await file.exists()) {
      var res = await file.readAsString();
      return res;
    }

    return null;
  }

  static Future<T> get<T>(
      String url, T Function(dynamic) parser, String errorMessage) async {
    try {
      final response = await getData(url, {'cache-control': "max-age=1296000"});
      final decodeJson = jsonDecode(response);

      return parser(decodeJson);
    } catch (error, stackTrace) {
      print(errorMessage + stackTrace.toString());
      return null;
    }
  }
}
