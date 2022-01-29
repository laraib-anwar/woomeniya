import 'package:shared_preferences/shared_preferences.dart';
import '../models/BasketItems.dart';
import 'dart:convert';

class LocalStorageService {
  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String value = prefs.getString(key);
    return value;
  }

  Future<List<String>> getStringList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> value = prefs.getStringList(key);
    return value;
  }

  Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> setStringList(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  Future<List<BasketItem>> getBasketItems() async {
    List<BasketItem> basketIems = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedString = (prefs.getString("basketItems") ?? null);
    if (encodedString != null) {
      final decodedString = json.decode(encodedString);
      for (int i = 0; i < decodedString.length; i++) {
        basketIems.add(BasketItem.fromJson(decodedString[i]));
      }
    }
    return basketIems;
  }

  Future<void> setBasketItems(List<BasketItem> basketItems) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedString = json.encode(
      basketItems
          .map<Map<String, dynamic>>(
              (basketItem) => BasketItem.toMap(basketItem))
          .toList(),
    );
    await prefs.setString("basketItems", encodedString);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool value = prefs.getBool(key);
    return value;
  }

  Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<Map<String, dynamic>> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String accessToken = prefs.getString('accessToken');
    final String refreshToken = prefs.getString('refreshToken');
    return {'accessToken': accessToken, 'refreshToken': refreshToken};
  }

  Future<void> setAuthToken({String accessToken, String refreshToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
  }
}
