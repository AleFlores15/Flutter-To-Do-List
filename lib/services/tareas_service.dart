import  'dart:convert';
import 'dart:math';
import 'package:flutter_to_do_list/dto/api_response.dart';
import 'package:flutter_to_do_list/dto/auth_response.dart';
import 'package:flutter_to_do_list/services/login_service.dart';
import 'package:http/http.dart' as http;
String urlBase= 'http://localhost:9999';
class tareasService {
  static Future<ApiResponse> getTareas() async {
    print('service entra');
    var authToken = LoginService.responseBody['response']['authToken']; // Accede al valor del authToken del mapa de LoginService
    print(authToken);
    var response = await http.get(
      Uri.parse(urlBase + '/api/v1/task'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + authToken, // Usa el authToken en el encabezado de la solicitud
      },
    );
    if (response.statusCode == 200) {
      return ApiResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener tareas');
    }
  }
}

