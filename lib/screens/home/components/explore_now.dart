import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';



class ExploreNow extends StatefulWidget {

  const ExploreNow({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreNowState createState() => _ExploreNowState();
}

class _ExploreNowState extends State<ExploreNow> {
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
          children:[CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        autoPlay: true,
        initialPage: 0,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayInterval: Duration(seconds: 2),
        onPageChanged: (index,res) {
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
                    color: kSecondaryColor,
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
                width: getProportionateScreenWidth(10),
                height: getProportionateScreenWidth(10),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.redAccent : Colors.green,
                ),
              );
            }),
          ),
    
        ]));
          
    
  }

  
}
