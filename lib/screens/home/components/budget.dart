import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class Budget extends StatelessWidget {
  const Budget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('Budget Buy',
          textAlign: TextAlign.center, style: TextStyle(color: kPrimaryColor, fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height:10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Text('Printed T Shirts',
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text('Half sleeves',
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text('Full Sleeves',
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ],
      ),
      SizedBox(height: getProportionateScreenWidth(20)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Text('Ethnic Fusion Wear',
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text(
                'Plain T shirts', style: TextStyle(fontWeight: FontWeight.bold)
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text('Pyjama', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ],
      )
      
      
    ]);
  }
}
