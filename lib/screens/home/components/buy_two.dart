import 'package:flutter/material.dart';

import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class BuyTwo extends StatelessWidget {
  const BuyTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      child: Text('Buy 2 Get 1 Zone',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 18,
            height: 2,
          )),
      width: MediaQuery.of(context).size.width,
      height: getProportionateScreenWidth(100),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
    ));
  }
}