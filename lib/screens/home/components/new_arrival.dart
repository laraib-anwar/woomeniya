import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('New Arrival',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kPrimaryColor, fontSize: 22, fontWeight: FontWeight.bold)),
      SizedBox(height: 10),
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
                    color: Colors.red[300],
                  ),
                  child: Image.asset('assets/images/printed_t_shirt.jpg'),
                ),
              ),
              Text(
                'Printed T Shirts',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                    color: Colors.orange[300],
                  ),
                  child: Image.asset('assets/images/half_sleeve_t_shirt.jpg'),
                ),
              ),
              Text(
                'Half sleeves',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                    color: Colors.green[300],
                  ),
                  child: Image.asset('assets/images/full_sleeve_t_shirt.jpg'),
                ),
              ),
              Text(
                'Full Sleeves',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                    color: Colors.yellow[300],
                  ),
                  child: Image.asset('assets/images/ethnic.jpg'),
                ),
              ),
              Text(
                'Ethnic Fusion Wear',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                    color: Colors.blue[300],
                  ),
                  child: Image.asset('assets/images/plain_t_shirt.jpg'),
                ),
              ),
              Text(
                'Plain T shirts',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.grey[300],
                    ),
                    child: Image.asset('assets/images/pyjama.jpeg')),
              ),
              Text(
                'Pyjama',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.purple[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/boxer.jpg')),
              ),
              Text(
                'Boxer',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.indigo[300],
                    ),
                    child: Image.asset('assets/images/jogger.jpg')),
              ),
              Text(
                'Joggers',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.brown[300],
                    ),
                    child: Image.asset('assets/images/denims.jpg')),
              ),
              Text(
                'Denims',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.teal[300],
                    ),
                    child: Image.asset('assets/images/shirt.jpg')),
              ),
              Text(
                'Shirts',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.cyan[300],
                    ),
                    child: Image.asset('assets/images/shoes2.png')),
              ),
              Text(
                'Joggers',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.orange[100],
                    ),
                    child: Image.asset('assets/images/Polo_t_shirt.jpg')),
              ),
              Text(
                'Polo Tshirts',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.red[100],
                    ),
                    child: Image.asset('assets/images/vest.jpeg')),
              ),
              Text(
                'Vests',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.blue[100],
                    ),
                    child: Image.asset('assets/images/short.jpg')),
              ),
              Text(
                'Shorts',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.pink[300],
                    ),
                    child: Image.asset('assets/images/combo.jpg')),
              ),
              Text(
                'Combo Pack',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.grey[300],
                    ),
                    child: Image.asset('assets/images/hoddy.jpg')),
              ),
              Text(
                'Hoodies',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.yellow[100],
                    ),
                    child: Image.asset('assets/images/jacket.jpg')),
              ),
              Text(
                'Jackets',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      color: Colors.purple[100],
                    ),
                    child: Image.asset('assets/images/sweater.jpg')),
              ),
              Text(
                'Sweaters',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    ]);
  }
}
