import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickets_app/config.dart';

class HomeAPI {
  
  final String url = Config.initConfig['host'];

  Future<http.Response> getEvents(String token) {
  
    return http.get(
      Uri.parse('$url/event'),
      headers: <String, String>{'Authorization': 'Bearer $token'},
    );
    
  }

  Future<List<Map<dynamic, dynamic>>> handleEvents(String token) async {
    http.Response response = await getEvents(token);
    List<Map<dynamic, dynamic>> jsonResponse = List<Map<dynamic, dynamic>>.from(json.decode(response.body));

    return jsonResponse;
  }
}
