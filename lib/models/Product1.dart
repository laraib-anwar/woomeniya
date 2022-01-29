import 'ProductPrices.dart';

class Product {
  int id;
  int subcategoryId;
  String name;
  String brand;
  String description;
  List<String> imageUrls;
  List<ProductPrices> prices;
  int selectedPrice;
  bool isPopular;
  double rating;
  Product(
      { this.id,
       this.subcategoryId,
       this.brand,
       this.name,
       this.description,
       this.imageUrls,
       this.prices,
       this.selectedPrice,
       this.isPopular,
       this.rating});
  Product.fromJson(Map<String, dynamic> parsedJson, String source)
      : id = parsedJson['id'],
        name = parsedJson['name'],
        subcategoryId = parsedJson['subcategory_id'],
        brand = parsedJson['brand_name'],
        description = parsedJson["description"] ?? "",
        imageUrls = parsedJson['images'].length > 0
            ? List<String>.from(parsedJson['images'].map(
                    (entry) => source == "server" ? entry["image_url"] : entry))
                .toList()
            : ["https://storage.googleapis.com/dekorner/assets/logo_dark.png"],
        prices = parsedJson['prices']
                .map<ProductPrices>(
                    (price) => ProductPrices.fromJson(price, source))
                .toList() ??
            [],
        selectedPrice = parsedJson["selected_price"] ?? 0,
        isPopular = parsedJson["isPopular"],
        rating = parsedJson["rating"];
  static Map<String, dynamic> toMap(Product product) => {
        "id": product.id,
        "name": product.name,
        "subcategory_id": product.subcategoryId,
        "brand_name": product.brand,
        "description": product.description,
        "images": product.imageUrls,
        "prices": product.prices
            .map<Map<String, dynamic>>((price) => ProductPrices.toMap(price))
            .toList(),
        "selected_price": product.selectedPrice,
        "rating": product.rating,
      };
}
