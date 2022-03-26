import '../models/Address.dart';
import '../models/BasketItems.dart';
import '../models/Address.dart';

class NewOrder {
  int id;
  int deliverySlot;
  String deliveryDate;
  int paymentMethod;
  String razorpayOrderId;
  String razorpayPaymentId;
  int paymentAuthenticated;
  List<BasketItem> basketItems;
  Address address;
  int promoId;
  int subtotal;
  int deliveryCharge;
  int discount;
  int total;
  NewOrder(
      {this.id,
      this.deliverySlot,
      this.deliveryDate,
      this.paymentMethod,
      this.razorpayOrderId,
      this.razorpayPaymentId,
      this.paymentAuthenticated,
      this.basketItems,
      this.address,
      this.promoId,
      this.subtotal,
      this.deliveryCharge,
      this.discount,
      this.total});
  NewOrder.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        deliverySlot = parsedJson['delivery_slot'],
        basketItems = parsedJson['orderProducts']
            .map<BasketItem>((item) => BasketItem.fromJson(item))
            .toList(),
        address = parsedJson['address']
            .map<Address>((address) => Address.fromJson(address));

  Map<String, dynamic> toJson() => {
        "address": this.address.id,
        "delivery_slot": this.deliverySlot,
        "delivery_date": this.deliveryDate,
        "payment_option": this.paymentMethod,
        "razorpay_order_id": this.razorpayOrderId,
        "razorpay_payment_id": this.razorpayPaymentId,
        "payment_authenticated": this.paymentAuthenticated,
        "promoId": this.promoId,
        "user_subtotal": this.subtotal,
        "user_delivery_charge": this.deliveryCharge,
        "user_discount": this.discount,
        "user_total": this.total,
        "basketItems": this
            .basketItems
            .map((item) => BasketItem(
                    product: item.product,
                    quantity: item.quantity,
                    message: item.message,
                    attachmentUrl: item.attachmentUrl)
                .toJson())
            .toList()
      };
}
