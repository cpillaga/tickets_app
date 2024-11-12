import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickets_app/config.dart';

class UserAPI {
  String url = Config.initConfig['host'];

  Future<http.Response> initUser(String idUser, String token) {
    return http.get(Uri.parse('$url/user/$idUser/basic-info'), headers: <String, String>{'Authorization': 'Bearer $token', 'Content-Type': 'application/json'});
  }

  Future<Map<String, dynamic>> handleUser(String idUser, String token) async {
    
    http.Response response = await initUser(idUser, token);
    Map<String, dynamic> jsonResponse = Map<String, dynamic>.from(json.decode(response.body));

    return jsonResponse;
  }
}
