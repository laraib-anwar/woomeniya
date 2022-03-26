import 'package:dio/dio.dart';
import '../models/Category.dart';
import 'http_service.dart';

class CategoryService {
  HttpService _httpService = HttpService();

  Future<List<Category>> fetchCategories() async {
    final Dio dio = await _httpService.getApiClient();
    List<Category> categoryList = [];
    try {
      final response = await dio.get('api/category/');
      if (response.statusCode == 200) {
        final unparsedJson = response.data.toList();
        for (int i = 0; i < unparsedJson.length; i++) {
          categoryList.add(Category.fromJson(unparsedJson[i]));
        }
      }
      return categoryList;
    } on DioError catch (e) {
      return null;
    }
  }
}
