import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'http_service.dart';
import '../models/NewOrder.dart';
import '../models/Order.dart';

class OrderService {
  HttpService _httpService = HttpService();

  Future<bool> createOrder({@required NewOrder order}) async {
    final Dio dio = await _httpService.getAuthenticatedApiClient();
    try {
      final response =
          await dio.post('api/order/create/', data: order.toJson());
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<List<Order>> fetchOrders() async {
    final Dio dio = await _httpService.getAuthenticatedApiClient();
    final List<Order> ordersList = [];
    try {
      final response = await dio.get(
        'api/orders/all/',
      );
      if (response.statusCode == 200) {
        final parsedJson = response.data.toList();
        print(parsedJson[0]['delivery_date']);
        for (int i = 0; i < parsedJson.length; i++) {
          ordersList.add(Order.fromJson(parsedJson[i]));
        }
      }
      return ordersList;
    } on DioError catch (e) {
      return ordersList;
    }
  }

  Future<Order> fetchOrder({@required String orderId}) async {
    final Dio dio = await _httpService.getAuthenticatedApiClient();
    final List<Order> ordersList = [];
    try {
      final response = await dio.get('api/order/${orderId}/');
      if (response.statusCode == 200) {
        final parsedJson = response.data;
        return Order.fromJson(parsedJson);
      }
      return null;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<bool> cancelOrder(
      {@required String orderId,
      @required int cancellationReason,
      String comments}) async {
    final Dio dio = await _httpService.getAuthenticatedApiClient();
    try {
      final response = await dio.post('api/order/cancel/', data: {
        'order_id': orderId,
        'cancellation_reason': cancellationReason,
        'cancellation_comments': comments
      });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> acceptOrder({@required String orderId}) async {
    final Dio dio = await _httpService.getAuthenticatedApiClient();
    try {
      final response =
          await dio.post('api/order/accept/', data: {'order_id': orderId});
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> rateOrder({@required String orderId, int rating}) async {
    final Dio dio = await _httpService.getAuthenticatedApiClient();
    try {
      final response = await dio.post('api/order/rate/',
          data: {'order_id': orderId, 'rating': rating});
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> reviewOrder({@required String orderId, String review}) async {
    final Dio dio = await _httpService.getAuthenticatedApiClient();
    try {
      final response = await dio.post('api/order/review/',
          data: {'order_id': orderId, 'review': review});
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      print(e.message.toString());
      return false;
    }
  }
}
