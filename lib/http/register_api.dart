import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickets_app/config.dart';

class RegisterAPI {
  final String url = Config.initConfig['host'];

  Future<http.Response> createUser(String name, String phone, String email, String password) {

    return http.post(
      Uri.parse('$url/user'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "roles": ["ADMIN", "USER", "EVENT_OWNER", "SCANNER"]
      }),
    );
  }

  Future<Map<dynamic, dynamic>> handleCreate(String name, String phone, String email, String password) async {
  
    http.Response response = await createUser(name, phone, email, password);
    Map<dynamic, dynamic> jsonResponse = Map<dynamic, dynamic>.from(json.decode(response.body));

    return jsonResponse;
  }
}
