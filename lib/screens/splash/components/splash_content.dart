import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Spacer(),
        Image(image: AssetImage("assets/images/woomeniya_splash.png"),height: 300,),
        // Text(
        //   "WOOMENIYA",
        //   style: TextStyle(
        //     fontSize: getProportionateScreenWidth(36),
        //     color: kPrimaryColor,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 1),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(220),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
