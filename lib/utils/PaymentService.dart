// import 'package:flutter/cupertino.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// // import '../secrets.dart';

// class PaymentService {
//   Razorpay _razorpay = Razorpay();
//   Function handlePaymentSuccess;
//   Function handlePaymentError;
//   PaymentService({@required this.handlePaymentSuccess, @required this.handlePaymentError}) {
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
//     _razorpay.on(
//         Razorpay.EVENT_EXTERNAL_WALLET, (ExternalWalletResponse response) {});
//   }

//   void openCheckout(
//       {@required int amount,
//       @required String phone,
//       @required String email,
//       @required String orderId,
//       @required String description}) {
//     var options = {
//       "key": '',
//       "amount": amount * 100,
//       "name": "zifresh",
//       "order_id": orderId,
//       "description": description != null ? description : "Grocery",
//       "prefill": {"contact": phone, "email": email},
//       "external": {
//         "wallets": ["paytm"]
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//     }
//   }
// }
