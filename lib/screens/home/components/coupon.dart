import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class Coupon extends StatelessWidget {
  const Coupon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Column(children: [
        Text(":DISCOVER MORE:", textAlign: TextAlign.center, style: TextStyle(fontSize:22, fontWeight: FontWeight.bold),),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Use coupon WMM 100 at checkout",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Get 100 off on your first offer",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: getProportionateScreenWidth(80),
                        width: getProportionateScreenWidth(80),
                        child: Image.asset(
                            'assets/images/tshirt.png'),
                            color: Colors.teal,),
                    Container(
                        height: getProportionateScreenWidth(80),
                        width: getProportionateScreenWidth(80),
                        child: Image.asset(
                            'assets/images/shoes2.png'),
                            color: Colors.pink),
                    Container(
                        height: getProportionateScreenWidth(80),
                        width: getProportionateScreenWidth(80),
                        child: Image.asset(
                            'assets/images/ps4_console_blue_3.png'),
                            color:Colors.deepPurple),
                  ],
                )
              ],
            ))
      ]);
    });
  }
}
