import  'dart:convert';
import 'dart:developer';
import 'package:flutter_to_do_list/bloc/tarea_cubit.dart';
import 'package:flutter_to_do_list/dto/api_response.dart';
import 'package:flutter_to_do_list/dto/auth_response.dart';
import 'package:flutter_to_do_list/dto/task_response.dart';
import 'package:flutter_to_do_list/services/login_service.dart';
import 'package:http/http.dart' as http;
String urlBase= 'http://localhost:9999';
var authToken = LoginService.responseBody['response']['authToken'];
class tareasService {
  static Future<ApiResponse> getTareas() async {
    Map<String, dynamic> responseBody = {};
    var response = await http.get(
      Uri.parse(urlBase + '/api/v1/task'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + authToken, 
      },
    );
    if (response.statusCode == 200) {                                          
      responseBody = json.decode(response.body);
      
      //print(responseBody['response']);
      TareasCubit().parseTareas(responseBody['response']);
      return ApiResponse.fromJson(responseBody);
    } else {
      throw Exception('Error al obtener tareas');
    }
  }

  static Future<taskResponse> postTareas(String desc, String date, int id) async{
     Map<String, dynamic> responseBody = {}; 
    var response = await http.post(
      Uri.parse(urlBase + '/api/v1/task'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + authToken,
      },
      body: jsonEncode({
        'description': desc,
        'date': date,
        'labelIds': [id]
      }),

    );

    if (response.statusCode == 200) {
      responseBody = json.decode(response.body);
      return taskResponse.fromJson(responseBody);
    } else {
      throw Exception('Error al obtener tareas');
    }

  }
}

