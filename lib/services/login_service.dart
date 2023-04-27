import  'dart:convert';
import 'dart:math';
import 'package:flutter_to_do_list/dto/api_response.dart';
import 'package:flutter_to_do_list/dto/auth_response.dart';
import 'package:http/http.dart' as http;

const String urlBase= 'http://localhost:9999';

class LoginService{
  static Future<ApiResponse> login(String email, String password) async{
    var response = await http.post(
      Uri.parse(urlBase + '/api/v1/auth/login')
      ,
      headers: 
      
      {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode({
        'username': email,
        'password': password
      }),
    );
    print(response.body);
    print('sss');
    if (response.statusCode == 200 ){
      //log(897897897);
      print('ók');
      return ApiResponse.fromJson(json.decode(response.body));

    } else {  
      throw Exception('Error al iniciar sesión');
    }

    
  }
} 