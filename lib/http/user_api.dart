import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickets_app/config.dart';

class UserAPI {
  final String url = Config.initConfig['host'];

  Future<http.Response> initUser(String idUser, String token) {
    return http.get(Uri.parse('$url/user/$idUser/basic-info'), headers: <String, String>{'Authorization': token, 'Content-Type': 'application/json'});
  }

  Future<Map<String, dynamic>> handleUser(String idUser, String token) async {
    print(token);
    http.Response response = await initUser(idUser, token);
    Map<String, dynamic> jsonResponse = Map<String, dynamic>.from(json.decode(response.body));

    print(jsonResponse);
    return jsonResponse;
  }
}
