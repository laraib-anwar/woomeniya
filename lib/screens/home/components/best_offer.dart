import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class BestOffer extends StatefulWidget {
  const BestOffer({
    Key? key,
  }) : super(key: key);

  @override
  _BestOfferState createState() => _BestOfferState();
}

class _BestOfferState extends State<BestOffer> {
  int _current = 0;
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
              Text("Best Offer",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          CarouselSlider(
            options: CarouselOptions(
              height: 250.0,
              autoPlay: true,
              initialPage: 0,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayInterval: Duration(seconds: 2),
              onPageChanged: (index, res) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(imgList, (index, url) {
              return Container(
                width: getProportionateScreenWidth(5),
                height: getProportionateScreenWidth(5),
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.black : Colors.grey,
                ),
              );
            }),
          ),
        ]));
  }
}
