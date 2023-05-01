import  'dart:convert';
import 'dart:math';
import 'package:flutter_to_do_list/dto/api_response.dart';
import 'package:flutter_to_do_list/dto/auth_response.dart';
import 'package:http/http.dart' as http;

const String urlBase= 'https://aleflores15-orange-telegram-jpw67qg7gqpcqwp9-9999.preview.app.github.dev';

class LoginService {
  static Map<String, dynamic> responseBody = {}; // Cambia el tipo de la variable

  static Future<ApiResponse> login(String email, String password) async {
    var response = await http.post(
      Uri.parse(urlBase + '/api/v1/auth/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode({'username': email, 'password': password}),
    );
    
    if (response.statusCode == 200) {
      responseBody = json.decode(response.body); // Decodifica el cuerpo de la respuesta en un mapa
      return ApiResponse.fromJson(responseBody);
    } else {
      throw Exception('Error al iniciar sesión');
    }
  }
}
