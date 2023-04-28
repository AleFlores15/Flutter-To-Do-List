import 'dart:developer';

import 'package:flutter_to_do_list/dto/auth_response.dart';

class ApiResponseTest{
  String code;
  dynamic response;
  String errorMessage;
  ApiResponseTest({required this.code, required this.response, required this. errorMessage});
  factory ApiResponseTest.fromJson(Map<String,dynamic> json){
    log('Imprimiendo code: ${json['code']}');
    log('Imprimiendo response: ${json['response']}');
    log('Imprimiendo errorMessage: ${json['errorMessage']}');

    return ApiResponseTest(
      code: json['code'],
      response: AuthResponse.fromJson(json['response']),
      errorMessage: json['errorMessage']??'',
    );
  }


}
