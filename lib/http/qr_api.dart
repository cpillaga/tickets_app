import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickets_app/config.dart';

class QrAPI {

  final String url = Config.initConfig['host'];

  Future<http.Response> initTicket(String idEvent, String token, int cantidad) {
  
    return http.post(
      Uri.parse('$url/ticket/$idEvent/$cantidad'),
      headers: <String, String>{'Authorization': 'Bearer $token'}
    );

  }

  Future<List<dynamic>> handleTicket(String idEvent, String token, int cantidad) async {

    http.Response response = await initTicket(idEvent, token, cantidad);
    List<dynamic> jsonResponse = List<dynamic>.from(json.decode(response.body));
    return jsonResponse;

  }

  Future<http.Response> initQR(String idUser, String token) {
  
    return http.post(
      Uri.parse('$url/ticket/$idUser/1'),
      headers: <String, String>{'Authorization': 'Bearer $token'}
    );

  }

  Future<List<dynamic>> handleQR(String idUser, String token) async {

    http.Response response = await initQR(idUser, token);
    List<dynamic> jsonResponse = List<dynamic>.from(json.decode(response.body));
    return jsonResponse;
    
  }




  
}
