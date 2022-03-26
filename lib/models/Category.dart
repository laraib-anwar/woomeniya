import 'package:shop_app/models/Subcategory.dart';

class Category {
  int id;
  String name;
  List<Subcategory> subCategories;
  // String imageUrl;
  // String color;
  // String textColor;
  Category({this.id, this.name, this.subCategories});
  Category.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['name'],
        subCategories = [];
}
