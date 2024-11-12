import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickets_app/config.dart';

class ListTicketAPI {
  final String url = Config.initConfig['host'];

  Future<http.Response> initListTicket(String token, String idUser) {
    return http.get(Uri.parse('$url/ticket/user/$idUser'), headers: <String, String>{'Authorization': 'Bearer $token'});
  }

  Future<List<dynamic>> handleTicketList(String token, String idUser) async {
    http.Response response = await initListTicket(token, idUser);
    List<dynamic> jsonResponse = List<dynamic>.from(json.decode(response.body));
    return jsonResponse;
  }
}
