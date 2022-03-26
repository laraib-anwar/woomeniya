import 'package:dio/dio.dart';
import 'http_service.dart';

import '../models/Product.dart';

class ProductListService {
  HttpService _httpService = HttpService();

  Future<List<Product>> fetchProducts({int subcategoryId}) async {
    final Dio dio = await _httpService.getApiClient();
    List<Product> productList = [];
    try {
      final response = await dio.get('api/products/${subcategoryId}/');
      if (response.statusCode == 200) {
        final unparsedJson = response.data.toList();
        for (int i = 0; i < unparsedJson.length; i++) {
          productList.add(Product.fromJson(unparsedJson[i], "server"));
        }
      }
      return productList;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<Product>> fetchBrandProducts({int brandId}) async {
    final Dio dio = await _httpService.getApiClient();
    List<Product> productList = [];
    try {
      final response = await dio.get('api/brand/products/${brandId}/');
      if (response.statusCode == 200) {
        final unparsedJson = response.data.toList();
        for (int i = 0; i < unparsedJson.length; i++) {
          productList.add(Product.fromJson(unparsedJson[i], "server"));
        }
      }
      return productList;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<Product>> fetchTopProducts() async {
    final Dio dio = await _httpService.getApiClient();
    List<Product> productList = [];
    try {
      final response = await dio.get('api/products/top/');
      if (response.statusCode == 200) {
        final unparsedJson = response.data.toList();
        for (int i = 0; i < unparsedJson.length; i++) {
          productList.add(Product.fromJson(unparsedJson[i], "server"));
        }
      }
      return productList;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<Product>> fetchTopProductsCategoryWise({int categoryId}) async {
    final Dio dio = await _httpService.getApiClient();
    List<Product> productList = [];
    try {
      final response = await dio.get('api/products/${categoryId}/top/');
      if (response.statusCode == 200) {
        final unparsedJson = response.data.toList();
        for (int i = 0; i < unparsedJson.length; i++) {
          productList.add(Product.fromJson(unparsedJson[i], "server"));
        }
      }
      return productList;
    } on DioError catch (e) {
      return null;
    }
  }
}
