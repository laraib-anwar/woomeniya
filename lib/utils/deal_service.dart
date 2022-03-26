import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Deal.dart';
import 'http_service.dart';

class DealService {
  HttpService _httpService = HttpService();

  Future<List<Deal>> fetchDeals({@required int categoryId}) async {
    final Dio dio = await _httpService.getApiClient();
    List<Deal> dealList = [];
    try {
      final response =
          await dio.post('api/deals/', data: {'category_id': categoryId});
      if (response.statusCode == 200) {
        final unparsedJson = response.data.toList();
        for (int i = 0; i < unparsedJson.length; i++) {
          dealList.add(Deal.fromJson(unparsedJson[i]));
        }
      }
      return dealList;
    } on DioError catch (e) {
      return null;
    }
  }
}
