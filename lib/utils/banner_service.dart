import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/Banner.dart';
import 'http_service.dart';

class BannerService {
  HttpService _httpService = HttpService();

  Future<List<DisplayBanner>> fetchBanners(
      {@required int location, int categoryId}) async {
    final Dio dio = await _httpService.getApiClient();
    List<DisplayBanner> bannerList = [];
    try {
      final response = await dio.post('api/banners/',
          data: {'display_location': location, 'category_id': categoryId});
      if (response.statusCode == 200) {
        final unparsedJson = response.data.toList();
        for (int i = 0; i < unparsedJson.length; i++) {
          bannerList.add(DisplayBanner.fromJson(unparsedJson[i]));
        }
      }
      return bannerList;
    } on DioError catch (e) {
      return null;
    }
  }
}
