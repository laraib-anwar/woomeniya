import 'Product1.dart';
class OrderItem {
  Product product;
  int quantity;
  String selectedWeight;
  int? unitPrice;
  int? totalItemPrice;
  OrderItem({required this.product, required this.quantity, required this.selectedWeight});
  OrderItem.fromJson(Map<String, dynamic> parsedJson, String source)
    : product = Product.fromJson(parsedJson["item"], source),
      quantity = parsedJson["quantity"],
      selectedWeight = '${parsedJson["selected_weight"]} ${parsedJson["unit"]}',
      unitPrice = parsedJson['unit_price'],
      totalItemPrice = parsedJson['total_item_price'];
}