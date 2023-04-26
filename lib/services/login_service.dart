import  'dart:convert';
import 'package:http/http.dart' as http;

const String urlBase= 'https://ernestomar-potential-goggles-4vxwxqpp42v-9999.preview.app.github.dev/';

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
        'email': email,
        'password': password
      }),
    );
    if (response.statusCode == 200){
      return ApiResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al iniciar sesión');
    }

    
  }
}