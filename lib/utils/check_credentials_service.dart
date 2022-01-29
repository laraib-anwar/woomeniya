import 'package:flutter/material.dart';
import 'http_service.dart';
import 'package:dio/dio.dart';
class CheckCredentialsService {
  final HttpService _httpService = HttpService();
  Future<bool> checkEmailAndPhone({@required String email,@required String phone}) async {
    final dio = await _httpService.getApiClient();
    try {
      final response = await dio.post('api/checkcredential/', data: {'email': email, 'phone': phone});
      if (response.statusCode == 200) {
        return response.data['present'];
      }
      return null;
    } on DioError catch (e) {
      return null;
    }
  }
}
