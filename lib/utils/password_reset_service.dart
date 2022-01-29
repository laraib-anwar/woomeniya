import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'http_service.dart';

class PasswordResetService {
  HttpService _httpService = HttpService();
  Future<Map<String, dynamic>> resetPassword({@required String email}) async {
    final Dio dio = await _httpService.getApiClient();
    try {
      final response = await dio.post(
          'https://api.makenica.com/password_reset/',
          data: {'email': email});
      if (response.statusCode == 200) {
        return {
          "success": true,
          "message": "Password reset link have been sent to your email address."
        };
      }
      return {
        "success": false,
        "message": "Something went wrong. Try after sometime."
      };
    } on DioError catch (e) {
      final errorResponse = jsonDecode(e.response.toString()) as Map;
      if (errorResponse.containsKey('email')) {
        if (errorResponse['email'][0].startsWith('There is no active user')) {
          return {
            "success": false,
            "message": "No user found with this email."
          };
        }
      } else {
        return {
          "success": false,
          "message": "Something went wrong. Try after sometime."
        };
      }
    }
  }
}
