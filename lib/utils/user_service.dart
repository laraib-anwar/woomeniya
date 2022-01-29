import 'http_service.dart';
import 'package:dio/dio.dart';
import '../models/User.dart';

class CurrentUserService {
  final HttpService _httpService = HttpService();
  Future<User> getCurrentUser() async {
    final dio = await _httpService.getAuthenticatedApiClient();
    try {
      final currentuserResponse = await dio.post('api/currentuser/');
      if (currentuserResponse.statusCode == 200) {
        final user = User.fromJson(currentuserResponse.data);
        return user;
      }
      return null;
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        return null;
      }
      return null;
    }
  }
}
