import 'dart:developer';
import 'package:flutter_to_do_list/dto/auth_response.dart';
class ApiResponse{
  String code;
  dynamic response;
  String errorMessage;
  
  ApiResponse({required this.code, required this.response, required this. errorMessage});
  
  factory ApiResponse.fromJson(Map<String,dynamic> json){
    return ApiResponse(
      code: json['code'],
      response: json['response'] is List
          ? List<dynamic>.from(json['response'].map((x) => x))
          : AuthResponse.fromJson(json['response']),
      errorMessage: json['errorMessage'] ?? '',
    );
  }
}
