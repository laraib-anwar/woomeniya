import 'dart:convert';
import '../models/User.dart';
import 'package:dio/dio.dart';
import 'local_storage.dart';
import 'http_service.dart';
import 'user_service.dart';

class LoginService {
  LocalStorageService _localStorage = LocalStorageService();
  HttpService _httpService = HttpService();
  CurrentUserService _currentUserService = CurrentUserService();
  Future<Map<String, dynamic>> loginWithEmail({String email, String password}) async {
    final Dio dio = await _httpService.getApiClient();
    try {
      final response = await dio.post('api/token/',
          data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        final String refreshToken = response.data['refresh'];
        final String accessToken = response.data['access'];
        await _localStorage.setAuthToken(accessToken: accessToken, refreshToken: refreshToken);
        final User user = await _currentUserService.getCurrentUser();
        return {'user': user, 'message': 'Login Successful.'};
      }
    } on DioError catch (e) {
      final errorResponse = jsonDecode(e.response.toString()) as Map;
      if (errorResponse.containsKey('detail')) {
        if (errorResponse['detail'].startsWith('No active account found with the given credentials')) {
          return {
            'user': null,
            'message':
            'Email or password is wrong. Please check your email and password again.'
          };
        } else {
          return {
            'user': null,
            'message':
            'Email or password is wrong. Please check your email and password again.'
          };
        }
      }
      return {
        'user': null,
        'message':
        'Email or password is wrong. Please check your email and password again.'
      };
    }
  }

  Future<Map<String, dynamic>> loginWithFirebase({String firebaseId}) async {
    final Dio dio = await _httpService.getApiClient();
    try {
      final response = await dio.post('api/login/firebase/',
          data: {"firebaseId": firebaseId});
      if (response.statusCode == 200) {
        final String refreshToken = response.data['refresh'];
        final String accessToken = response.data['access'];
        await _localStorage.setAuthToken(accessToken: accessToken, refreshToken: refreshToken);
        final User user = await _currentUserService.getCurrentUser();
        return {'user': user, 'message': 'Login Successful.'};
      }
    } on DioError catch (e) {
      return {
        'user': null,
        'message':
        'No user found with the given credentials. Check your login credentials and try again.'
      };
    }
  }
}
