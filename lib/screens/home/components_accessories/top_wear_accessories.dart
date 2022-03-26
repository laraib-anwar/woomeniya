import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class TopWear extends StatelessWidget {
  const TopWear({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('New Gadgets',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kPrimaryColor, fontSize: 22, fontWeight: FontWeight.bold)),
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
                  child: Image.asset('assets/images/printed_t_shirt.jpg')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
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
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/half_sleeve_t_shirt.jpg')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
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
                  child: Image.asset('assets/images/full_sleeve_t_shirt.jpg')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
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
                  child: Image.asset('assets/images/ethnic.jpg')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
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
                  child: Image.asset('assets/images/plain_t_shirt.jpg')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
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
                  child: Image.asset('assets/images/pyjama.jpeg')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
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
                  child: Image.asset('assets/images/boxer.jpg')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
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
                  child: Image.asset('assets/images/jogger.jpg')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
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
                  child: Image.asset('assets/images/denims.jpg')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('299 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('399',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
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
