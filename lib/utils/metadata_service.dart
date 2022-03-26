import 'http_service.dart';

import 'package:dio/dio.dart';
import '../models/AppMetadata.dart';

class MetadataService {
  HttpService _httpService = HttpService();

  Future<AppMetadata> fetchMetadata() async {
    final Dio dio = await _httpService.getApiClient();
    try {
      final response = await dio.get('api/metadata/');
      if (response.statusCode == 200) {
        return AppMetadata.fromJson(response.data[0]);
      }
      return null;
    } on DioError catch (e) {
      return null;
    }
  }
}
