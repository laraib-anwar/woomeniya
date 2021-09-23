import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 150.0),
      items: ["assets/images/ps4_console_white_1.png", "assets/images/Image Popular Product 2.png",
       "assets/images/glap.png", "assets/images/wireless headset.png"
       ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  i,
                  fit: BoxFit.cover,
                ));
          },
        );
      }).toList(),
    );

    // Widget build(BuildContext context) {
    //   return Container(
    //     // height: 90,
    //     width: double.infinity,
    //     margin: EdgeInsets.all(getProportionateScreenWidth(20)),
    //     padding: EdgeInsets.symmetric(
    //       horizontal: getProportionateScreenWidth(20),
    //       vertical: getProportionateScreenWidth(15),
    //     ),
    //     decoration: BoxDecoration(
    //       color: Color(0xFF4A3298),
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     child: Text.rich(
    //       TextSpan(
    //         style: TextStyle(color: Colors.white),
    //         children: [
    //           TextSpan(text: "A Summer Surpise\n"),
    //           TextSpan(
    //             text: "Cashback 20%",
    //             style: TextStyle(
    //               fontSize: getProportionateScreenWidth(24),
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }
  }
}
