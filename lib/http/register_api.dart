import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickets_app/config.dart';

class RegisterAPI {
  
  final String url = Config.initConfig['host'];

  Future<http.Response> createUser(String token, String name, String phone, String email, String password) {
    
    print('Nueva url: $url');

    return http.post( 
      Uri.parse('$url/user'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(
        <String, dynamic>{
            "name": name,
            "phone": phone,
            "email": email,
            "password": password,
            "roles": ["ADMIN", "USER", "EVENT_OWNER", "SCANNER"]
        }
      ),
    );
  }

  Future<List<Map<dynamic, dynamic>>> handleCreate(String token, String name, String phone, String email, String password) async {
    http.Response response = await createUser(token, name, phone, email, password);
    List<Map<dynamic, dynamic>> jsonResponse = List<Map<dynamic, dynamic>>.from(json.decode(response.body));

    return jsonResponse;
  }
}
