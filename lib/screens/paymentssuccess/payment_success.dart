import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class PaymentSuccessScreen extends StatelessWidget {
  static String routeName = "/payment_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20.0)),
              child: Text(
                "Your payment was done succesfully.",
                textAlign: TextAlign.center,
                style: TextStyle(color: kPrimaryColor, fontSize: 22)
              )),
          RaisedButton(
             textColor: Colors.red, // foreground
            onPressed: () {},
            child: Text('Ok',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red)),
          )
        ],
      ),
    );
  }
}
