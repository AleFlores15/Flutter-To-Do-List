import 'dart:developer';

import 'package:flutter_to_do_list/dto/auth_response.dart';

class ApiResponse{
  String code;
  // AuthResponse response;
  dynamic response;
  String errorMessage;
  ApiResponse({required this.code, required this.response, required this. errorMessage});
  factory ApiResponse.fromJson(Map<String,dynamic> json){
    log('Imprimiendo code: ${json['code']}');
    log('Imprimiendo response: ${json['response']}');
    log('Imprimiendo errorMessage: ${json['errorMessage']}');

    return ApiResponse(
      code: json['code'],
      response: AuthResponse.fromJson(json['response']),
      errorMessage: json['errorMessage']??'',
    );
  }


}
