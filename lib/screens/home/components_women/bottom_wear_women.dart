import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class BottomWear extends StatelessWidget {
  const BottomWear({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('Bottom Wear',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kPrimaryColor, fontSize: 22, fontWeight: FontWeight.bold)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: getProportionateScreenWidth(120),
                    width: getProportionateScreenWidth(120),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Image.asset('assets/images/printed_t_shirt.jpg')),
              ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: getProportionateScreenWidth(120),
                    width: getProportionateScreenWidth(120),
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child:
                        Image.asset('assets/images/half_sleeve_t_shirt.jpg')),
              ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: getProportionateScreenWidth(120),
                    width: getProportionateScreenWidth(120),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child:
                        Image.asset('assets/images/full_sleeve_t_shirt.jpg')),
              ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: getProportionateScreenWidth(120),
                    width: getProportionateScreenWidth(120),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                    ),
                    child: Image.asset('assets/images/ethnic.jpg')),
              ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: getProportionateScreenWidth(120),
                    width: getProportionateScreenWidth(120),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                    ),
                    child: Image.asset('assets/images/plain_t_shirt.jpg')),
              ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: getProportionateScreenWidth(120),
                    width: getProportionateScreenWidth(120),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                    ),
                    child: Image.asset('assets/images/pyjama.jpeg')),
              ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: getProportionateScreenWidth(120),
                    width: getProportionateScreenWidth(120),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                    ),
                    child: Image.asset('assets/images/boxer.jpg')),
              ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: getProportionateScreenWidth(120),
                    width: getProportionateScreenWidth(120),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Image.asset('assets/images/jogger.jpg')),
              ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: getProportionateScreenWidth(120),
                    width: getProportionateScreenWidth(120),
                    decoration: BoxDecoration(
                      color: Colors.red[500],
                    ),
                    child: Image.asset('assets/images/denims.jpg')),
              ),
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
