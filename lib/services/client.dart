import 'dart:convert';

import 'package:http/http.dart' as http;

import '../resources/constants.dart';

class Client {
  static Future get() async {
    try {
      late http.Response response;

      response = await http.get(
        uri,
        headers: headers,
      );

      final String data = utf8.decode(response.bodyBytes.toList());

      if (response.statusCode == 200) {
        return jsonDecode(data);
      } else {
        return {'status': 0, 'responseStatusCode': response.statusCode};
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future post(Map body) async {
    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      final String data = utf8.decode(response.bodyBytes.toList());
      if (response.statusCode == 200) {
        return jsonDecode(data);
      } else {
        return {'status': 0, 'responseStatusCode': response.statusCode};
      }
    } catch (e) {
      rethrow;
    }
  }
}
