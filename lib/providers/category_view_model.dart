import 'package:flutter/material.dart';
import 'package:shop_app/models/Banner.dart';
import 'package:shop_app/models/Brand.dart';
import 'package:shop_app/models/Deal.dart';

class CategoryViewModel extends ChangeNotifier {
  List<DisplayBanner> _carouselBanners;
  List<DisplayBanner> _smallBanners;
  List<Brand> _topBrands;
  List<Deal> _deals;

  CategoryViewModel(
      this._carouselBanners, this._smallBanners, this._deals, this._topBrands);

  List<DisplayBanner> get carouselBanners => _carouselBanners;

  List<DisplayBanner> get smallBanners => _smallBanners;

  set carouselBanners(List<DisplayBanner> carouselBanners) {
    _carouselBanners = carouselBanners;
    notifyListeners();
  }

  set smallBanners(List<DisplayBanner> smallBanners) {
    _smallBanners = smallBanners;
    notifyListeners();
  }

  List<Deal> get deals => _deals;

  set deals(List<Deal> deals) {
    _deals = deals;
    notifyListeners();
  }

  List<Brand> get topBrands => _topBrands;

  set topBrands(List<Brand> topBrands) {
    _topBrands = topBrands;
    notifyListeners();
  }
}
