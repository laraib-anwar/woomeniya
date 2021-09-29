import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class Trending extends StatelessWidget {
  const Trending({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('Best Trending',
          textAlign: TextAlign.center, style: TextStyle(color: kPrimaryColor,fontSize: 22, fontWeight: FontWeight.bold)),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold))
                  ],)
             
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold))
                ],
              )
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold))
                ],
              )
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
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.red[500],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style:TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ],
      ),
      
      
    ]);
  }
}
