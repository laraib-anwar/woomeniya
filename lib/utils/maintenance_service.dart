import 'http_service.dart';

import 'package:dio/dio.dart';

class MaintenanceService {
  HttpService _httpService = HttpService();

  Future<bool> checkForMaintenance() async {
    final Dio dio = await _httpService.getApiClient();
    try {
      final response = await dio.post('maintenance/');
      if (response.statusCode == 200) {
        bool status = response.data['status'];
        if (status != null) {
          return status;
        } else {
          return false;
        }
      }
      return false;
    } on DioError catch (e) {
      return false;
    }
  }
}
