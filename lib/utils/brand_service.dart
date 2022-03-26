import 'package:dio/dio.dart';
import 'http_service.dart';
import '../models/Brand.dart';

class BrandService {
  HttpService _httpService = HttpService();

  Future<List<Brand>> fetchTopBrands() async {
    final Dio dio = await _httpService.getApiClient();
    List<Brand> brandList = [];
    try {
      final response = await dio.get('api/brands/top/');
      if (response.statusCode == 200) {
        final parsedJson = response.data.toList();
        for (int i = 0; i < parsedJson.length; i++) {
          brandList.add(Brand.fromJson(parsedJson[i]));
        }
      }
      return brandList;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<Brand>> fetchAllBrands() async {
    final Dio dio = await _httpService.getApiClient();
    List<Brand> brandList = [];
    try {
      final response = await dio.get('api/brands/all/');
      if (response.statusCode == 200) {
        final parsedJson = response.data.toList();
        for (int i = 0; i < parsedJson.length; i++) {
          brandList.add(Brand.fromJson(parsedJson[i]));
        }
      }
      return brandList;
    } on DioError catch (e) {
      return null;
    }
  }
}
