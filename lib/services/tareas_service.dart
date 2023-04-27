import  'dart:convert';
import 'dart:math';
import 'package:flutter_to_do_list/dto/api_response.dart';
import 'package:flutter_to_do_list/dto/auth_response.dart';
import 'package:http/http.dart' as http;
String urlBase= 'http://localhost:9999';
class tareasService{
   
  static Future <ApiResponse> getTareas() async{
    var response = await http.get(
      Uri.parse(urlBase + '/api/v1/tareas')
      ,
      headers: 
      {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200 ){
      return ApiResponse.fromJson(json.decode(response.body));
    } else {  
      throw Exception('Error al obtener tareas');
    }
  }

}