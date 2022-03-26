import 'package:flutter/material.dart';
import 'package:shop_app/models/Banner.dart';
import 'package:shop_app/models/Deal.dart';
import 'package:shop_app/utils/banner_service.dart';
import 'package:shop_app/utils/deal_service.dart';
import '../models/BasketItems.dart';
import '../models/User.dart';
import '../models/Location.dart';
import '../models/Address.dart';
import '../models/Category.dart';
import '../utils/category_service.dart';
import '../utils/local_storage.dart';
import '../models/AppMetadata.dart';
import '../utils/metadata_service.dart';
import '../models/Brand.dart';
import '../utils/brand_service.dart';

class AppProvider extends ChangeNotifier {
  int _bottomNavbarIndex;
  List<BasketItem> _basketItems;
  User _currentUser;
  Location _currrentLocation;
  Address _currentAddress;
  List<Category> _categories;
  AppMetadata _metadata;
  Map<int, List<DisplayBanner>> _categoryWiseBanners = Map();
  Map<int, List<Brand>> _categoryWiseTopBrands = Map();
  Map<int, List<Deal>> _categoryWiseDeals = Map();

  AppProvider(this._currentUser, this._basketItems, this._currrentLocation,
      this._categories, this._metadata);

  CategoryService _categoryService = CategoryService();
  LocalStorageService _localStorage = LocalStorageService();
  MetadataService _metadataService = MetadataService();
  BrandService _brandService = BrandService();
  BannerService _bannerService = BannerService();
  DealService _dealService = DealService();

  int get bottomNavbarIndex => _bottomNavbarIndex;

  void set bottomNavbarIndex(int index) {
    _bottomNavbarIndex = index;
    notifyListeners();
  }

  List<BasketItem> get basketItems => _basketItems;

  void set basketItems(List<BasketItem> items) {
    _basketItems = items;
    notifyListeners();
    _localStorage.setBasketItems(_basketItems);
  }

  User get currentUser => _currentUser;

  void set currentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  Location get currentLocation => _currrentLocation;

  void set currentLocation(Location location) {
    _currrentLocation = location;
    notifyListeners();
  }

  Address get currentAddress => _currentAddress;

  void set currentAddress(Address address) {
    _currentAddress = address;
    notifyListeners();
  }

  List<Category> get categories => _categories;

  Future<void> loadCategories() async {
    _categories = await _categoryService.fetchCategories();
    Map<int, List<DisplayBanner>> newCategoryWiseBanners = Map();
    Map<int, List<Brand>> newCategoryWiseTopBrands = Map();
    Map<int, List<Deal>> newCategoryWiseDeals = Map();
    for (int i = 0; i < _categories.length; i++) {
      newCategoryWiseBanners[_categories[i].id] = null;
      newCategoryWiseDeals[_categories[i].id] = null;
      newCategoryWiseTopBrands[_categories[i].id] = null;
    }
    _categoryWiseBanners = newCategoryWiseBanners;
    _categoryWiseDeals = newCategoryWiseDeals;
    _categoryWiseTopBrands = newCategoryWiseTopBrands;
    notifyListeners();
  }

  Map<int, List<DisplayBanner>> get categoryWiseBanners => _categoryWiseBanners;

  void setCategoryWiseBanners(
      {@required List<DisplayBanner> banners, @required int categoryId}) {
    _categoryWiseBanners[categoryId] = banners;
    notifyListeners();
  }

  Map<int, List<Deal>> get categoryWiseDeals => _categoryWiseDeals;

  void setCategoryWiseDeals(
      {@required List<Deal> deals, @required int categoryId}) {
    _categoryWiseDeals[categoryId] = deals;
    notifyListeners();
  }

  Map<int, List<Brand>> get categoryWiseTopBrands => _categoryWiseTopBrands;

  void setCategoryWiseTopBrands(
      {@required List<Brand> topBrands, @required int categoryId}) {
    _categoryWiseTopBrands[categoryId] = topBrands;
    notifyListeners();
  }

  set categories(List<Category> categories) {
    _categories = categories;
    notifyListeners();
  }

  AppMetadata get metadata => _metadata;

  set metadata(AppMetadata metadata) {
    _metadata = metadata;
    notifyListeners();
  }

  Future<void> loadMetadata() async {
    _metadata = await _metadataService.fetchMetadata();
    notifyListeners();
  }

  Future<void> loadBanners({int displayLocation, int categoryId}) async {
    _categoryWiseBanners[categoryId] = await _bannerService.fetchBanners(
        location: displayLocation, categoryId: categoryId);
    notifyListeners();
  }

  Future<void> loadTopBrands({int categoryId}) async {
    _categoryWiseTopBrands[categoryId] = await _brandService.fetchTopBrands();
    notifyListeners();
  }

  Future<void> loadDeals({int categoryId}) async {
    _categoryWiseDeals[categoryId] =
        await _dealService.fetchDeals(categoryId: categoryId);
    notifyListeners();
  }
}
