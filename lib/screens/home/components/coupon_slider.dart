import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:shop_app/size_config.dart';

class CouponSlider extends StatelessWidget {
 


  List imgList = [
    "assets/images/ps4_console_white_1.png",
    "assets/images/Image Popular Product 3.png",
    "assets/images/glap.png",
    "assets/images/shoes2.png"
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 150.0,
              autoPlay: true,
              initialPage: 0,
              autoPlayCurve: Curves.linear,
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              autoPlayInterval: Duration(seconds: 1),
              // onPageChanged: (index, res) {
              //   setState(() {
              //     _current = index;
              //   });
              // },
            ),
            items: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: 350,
                      margin: EdgeInsets.symmetric(horizontal: 1.0),
                      decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        i,
                        fit: BoxFit.cover,
                      ));
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: map<Widget>(imgList, (index, url) {
          //     return Container(
          //       width: getProportionateScreenWidth(10),
          //       height: getProportionateScreenWidth(10),
          //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: _current == index ? Colors.black : Colors.grey,
          //       ),
          //     );
          //   }),
          // ),
        ]));
  }
}
