import 'package:intl/intl.dart';

import 'TestProduct.dart';
import 'Address.dart';
import 'OrderItem.dart';
// import '../constant.dart';

class Order {
  String id;
  int status;
  // String deliverySlot;
  // String paymentMethod;
  Address address;
  int subTotal;
  int deliveryCharge;
  int discount;
  int totalAmount;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deliveryDate;
  List<OrderItem> orderItems;
  String invoiceUrl;
  int rating;
  bool reviewWritten;
  Order(
      {this.id,
      this.address,
      // this.deliverySlot,
      // this.paymentMethod,
      this.orderItems,
      this.subTotal,
      this.deliveryCharge,
        this.discount,
      this.totalAmount,
      this.createdAt,
      this.updatedAt,
        this.deliveryDate,
      this.invoiceUrl,
      this.rating,
      this.reviewWritten});
  Order.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['order_id'],
        status = parsedJson["status"],
        // deliverySlot = deliverySlots[parsedJson['delivery_slot']],
        // paymentMethod = paymentMethods[parsedJson['payment_option']],
        orderItems = parsedJson['products']
            .map<OrderItem>((item) => OrderItem.fromJson(item, "server"))
            .toList(),
        subTotal = parsedJson['user_subtotal'],
        discount = parsedJson['user_discount'],
        deliveryCharge = parsedJson['user_delivery_charge'],
        totalAmount = parsedJson['user_total'],
        address = Address.fromJson(parsedJson['orderAddress']),
        createdAt = parsedJson['created_at'] != null
            ? DateTime.parse(parsedJson['created_at']
                .substring(0, parsedJson['created_at'].length - 6))
            : null,
        updatedAt = parsedJson['updated_at'] != null
            ? DateTime.parse(parsedJson['updated_at']
                .substring(0, parsedJson['updated_at'].length - 6))
            : null,
        deliveryDate = parsedJson['delivery_date'] != null
            ? DateFormat('yyyy-MM-dd').parse(parsedJson['delivery_date']) : null,
        invoiceUrl = parsedJson['invoice_url'],
        rating = parsedJson['rating'],
        reviewWritten = parsedJson['review_written'];
}
