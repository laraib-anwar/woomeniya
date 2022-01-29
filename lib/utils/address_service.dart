import 'package:dio/dio.dart';
import '../models/Address.dart';
import 'http_service.dart';

class AddressService {
  HttpService _httpService = HttpService();

  Future<Map<String, dynamic>> createAddressNew({Map<String, dynamic> data}) async {
    final Dio dio = await _httpService.getAuthenticatedApiClient();
    try {
      final response =
      await dio.post('api/newaddress/', data: data);
      if (response.statusCode == 201) {
        final unparsedJson = response.data;
        return {
          'success': true,
          'address': Address.fromJson(unparsedJson)
        };
      }
      return {
        'success': false,
        'address': null
      };
    } on DioError catch (e) {
      return {
        'success': false,
        'address': null
      };
    }
  }

  Future<bool> deleteAddress({int addressId}) async {
    final Dio dio = await _httpService.getAuthenticatedApiClient();
    try {
      final response =
      await dio.delete('api/address/delete/$addressId/');
      if (response.statusCode == 204) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      return false;
    }
  }
}
