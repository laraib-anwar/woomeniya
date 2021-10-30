// import '../constant.dart';

class ProductPrices {
  String size;
  int price;
  int MRP;
  int stockQuantity;
  int offPercentage;
  String unit;
  ProductPrices(
      {required this.price,
      required this.size,
      required this.MRP,
      required this.stockQuantity,
      required this.offPercentage,
      required this.unit});
  ProductPrices.fromJson(Map<String, dynamic> parsedJson, String source)
      : size = parsedJson["weight"],
        price = parsedJson["price"],
        MRP = parsedJson["MRP"],
        stockQuantity = parsedJson['stock_quantity'] ?? 50,
        offPercentage = parsedJson["off_percentage"] != null
            ? (parsedJson["off_percentage"] > 0
                ? parsedJson["off_percentage"]
                : 0)
            : null,
        unit = parsedJson["unit"];

  static Map<String, dynamic> toMap(ProductPrices price) => {
        "size": price.size,
        "price": price.price,
        "MRP": price.MRP,
        "stock_quantity": price.stockQuantity,
        "off_percentage ": price.offPercentage,
        "unit": price.unit
      };
}
