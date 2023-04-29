import  'dart:convert';
import 'dart:developer';
import 'package:flutter_to_do_list/bloc/label_cubit.dart';
import 'package:flutter_to_do_list/dto/api_response.dart';
import 'package:flutter_to_do_list/dto/auth_response.dart';
import 'package:flutter_to_do_list/dto/label_response.dart';
import 'package:flutter_to_do_list/services/login_service.dart';
import 'package:http/http.dart' as http;
String urlBase= 'http://localhost:9999';
var authToken = LoginService.responseBody['response']['authToken'];
class labelsService {
  static Future<ApiResponse> getLabels() async {
    var response = await http.get(
      Uri.parse(urlBase + '/api/v1/label'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + authToken, 
      },
    );
    if (response.statusCode == 200) {
      LabelsCubit().parseLabels(json.decode(response.body)['response']);
      return ApiResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener labels');
    }
  }

  static Future<LabelResponse> postLabel(String name) async{
    var response = await http.post(
      Uri.parse(urlBase + '/api/v1/label'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + authToken,
      },
      body: jsonEncode({'name': name}),
    );

    if (response.statusCode == 200) {
      return LabelResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al enviar tarea');
    }

  }
  // updatelabels
  static Future<LabelResponse> updateLabel( int index, String name) async{

      var response = await http.put(
      Uri.parse(urlBase + '/api/v1/label/${index}'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + authToken,
      },
      body: jsonEncode({'name': name}),
    );

    if (response.statusCode == 200) {
      return LabelResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al enviar tarea');
    }


  }
}

