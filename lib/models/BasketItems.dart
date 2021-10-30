import 'Product1.dart';

class BasketItem {
  int quantity;
  Product product;
  String message;
  String attachmentUrl;
  BasketItem(
      {this.quantity = 1,
      required this.product,
      required this.message,
      required this.attachmentUrl});
  BasketItem.fromJson(Map<String, dynamic> parsedJson)
      : quantity = parsedJson['quantity'],
        product = Product.fromJson(parsedJson['product'], "localStorage"),
        message = parsedJson['message'],
        attachmentUrl = parsedJson["attachment_url"];

  Map<String, dynamic> toJson() => {
        "product": this.product.id,
        "quantity": this.quantity,
        "selected_weight":
            this.product.prices[this.product.selectedPrice].size.toString(),
        "message": this.message,
        "unit": this.product.prices[this.product.selectedPrice].unit,
        "attachment_url": this.attachmentUrl,
        'unit_price': this.product.prices[this.product.selectedPrice].price,
        'total_item_price':
            this.product.prices[this.product.selectedPrice].price *
                this.quantity
      };

  static Map<String, dynamic> toMap(BasketItem item) => {
        "product": Product.toMap(item.product),
        "quantity": item.quantity,
        "message": item.message,
        "attachment_url": item.attachmentUrl
      };
}
