import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickets_app/config.dart';

class LoginAPI {
  final String url = Config.initConfig['host'];

  Future<http.Response> initLogin(String email, String password) {

    return http.post(
      Uri.parse('$url/auth/login'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{"email": email, "password": password}),
    );

  }

  Future<Map<String, dynamic>> handleSesion(String email, String password) async {

    http.Response response = await initLogin(email, password);
    Map<String, dynamic> jsonResponse = Map<String, dynamic>.from(json.decode(response.body));
    return jsonResponse;

  }

  Future<http.Response> initLogout(String token) {

    return http.post(
      Uri.parse('$url/auth/logout'),
      headers: <String, String>{'Authorization': 'Bearer $token'},
    );

  }

  Future<Map<String, dynamic>> handleSesionOut(String token) async {

    http.Response response = await initLogout(token);
    Map<String, dynamic> jsonResponse = Map<String, dynamic>.from(json.decode(response.body));
    return jsonResponse;

  }

}
