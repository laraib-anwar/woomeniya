import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class DiscountBanner extends StatefulWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  _DiscountBannerState createState() => _DiscountBannerState();
}

class _DiscountBannerState extends State<DiscountBanner> {
  int _current = 0;
  List imgList = [
    "assets/images/accessories_banner.jpg",
    "assets/images/accessories_banner_2.jpg",
    "assets/images/watch.jpg",
    "assets/images/watch_2.jpg",
    "assets/images/phone.jpg"
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
              height: 400.0,
              autoPlay: true,
              initialPage: 0,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayInterval: Duration(seconds: 2),
              onPageChanged: (i, res) {
                      setState(() {
                        _current = i;
                      });
                    },
            ),
            items: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        // margin: EdgeInsets.symmetric(horizontal: 1.0),
                        // decoration: BoxDecoration(
                        //     color: Colors.green[50],
                        //     borderRadius: BorderRadius.circular(20)),
                        
                        child: Image.asset(
                          
                          i,
                          width:400,
                          
                          
                          fit: BoxFit.cover,
                        )),
                  );
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
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
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
