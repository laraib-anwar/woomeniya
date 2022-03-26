import 'dart:convert';
import 'package:dio/dio.dart';
import 'http_service.dart';
import '../models/RegistrationModel.dart';

class RegistrationService {
  HttpService _httpService = HttpService();

  Future<Map<String, dynamic>> register({RegistrationModel currentState}) async {
    final Dio dio = await _httpService.getApiClient();
    try {
      final response = await dio.post('register/',
          data: currentState.toJson());
      if (response.statusCode == 201) {
        return {
          "success": true,
          "message":
          "Registration Successful. Confirmation email has been sent to your email address. Please verify your email to continue"
        };
      }
    } on DioError catch (e) {
      final errorResponse = jsonDecode(e.response.toString()) as Map;
      if (errorResponse.containsKey('name')) {
        return {"success": false, 'message': 'Name is required'};
      } else if (errorResponse.containsKey('phone')) {
        if (errorResponse['phone'][0] == 'This field may not be blank.') {
          return {"success": false, 'message': 'Phone no is required'};
        }
        return {"success": false, 'message': errorResponse['phone'][0]};
      } else if (errorResponse.containsKey('email')) {
        if (errorResponse['email'][0] == 'This field may not be blank.') {
          return {"success": false, 'message': 'Email is required'};
        }
        return {"success": false, 'message': errorResponse['email'][0]};
      } else if (errorResponse.containsKey('password1')) {
        if (errorResponse['password1'][0] == 'This field may not be blank.') {
          return {"success": false, 'message': 'Password is required'};
        } else if (errorResponse['password1'][0] ==
            'This password is too short. It must contain at least 8 characters.') {
          return {
            "success": false,
            'message': 'Password must be at least 8 character long.'
          };
        }
      } else if (errorResponse.containsKey('password2')) {
        if (errorResponse['password2'][0] == 'This field may not be blank.') {
          return {"success": false, 'message': 'Repeat Password is required'};
        }
      } else if (errorResponse.containsKey('non_field_errors')) {
        if (errorResponse['non_field_errors'][0]
            .startsWith('The two password')) {
          return {"success": false, 'message': 'Passwords did not match.'};
        }
      } else {
        return {
          "success": false,
          'message':
          'Faced some problems while registration. Try again after some time'
        };
      }
    }
  }
}
