import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('New Arrival', textAlign: TextAlign.center, style:TextStyle(color:kPrimaryColor, fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: [
            
            Container(
            height: getProportionateScreenWidth(120),
            width: getProportionateScreenWidth(120),
            decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: BorderRadius.circular(10),
              ),
            child:Image.asset('assets/images/tshirt.png')), Text('Printed T Shirts',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],),
            Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text('Half sleeves',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text('Full Sleeves',
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
              Container(
                
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.yellow[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
                  
              Text('Ethnic Fusion Wear',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text('Plain T shirts',style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text('Pyjama',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      )
,
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
                    color: Colors.purple[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Text('Boxer',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.indigo[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text('Joggers',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.brown[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text('Denims',
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
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.teal[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Text('Shirts',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.cyan[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text('Joggers',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text('Polo Tshirts',
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
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Text('Wests',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text('Shorts',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.pink[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text('Combo Pack',
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
              
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              Text('Hoodies',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              Text('Jackets',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/ps4_console_blue_1.png')),
              Text('Sweaters', style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
        ],
      ),

      ]
    );
  }
}

