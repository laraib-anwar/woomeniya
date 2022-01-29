import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class MonthlyStyle extends StatelessWidget {
  const MonthlyStyle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('Whats your monthly Style',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kPrimaryColor, fontSize: 22, fontWeight: FontWeight.bold)),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Text('January', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text('February', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.yellow[50],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text('March', style: TextStyle(fontWeight: FontWeight.bold))
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
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Text('April', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.amber[400],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text('May', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text('June', style: TextStyle(fontWeight: FontWeight.bold))
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
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Text('July', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.pink[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text('August', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.brown[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text('September', style: TextStyle(fontWeight: FontWeight.bold))
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
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.orange[600],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Text('October', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text(
                'November',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(80),
                  width: getProportionateScreenWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text(
                'December',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      )
    ]);
  }
}
