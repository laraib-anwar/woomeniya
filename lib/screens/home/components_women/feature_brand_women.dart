import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class FeatureBrand extends StatelessWidget {
  const FeatureBrand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('Feature Brand',
          textAlign: TextAlign.center, style: TextStyle(color: Colors.red[300],fontSize: 22,
              fontWeight: FontWeight.bold)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(250),
                  width: getProportionateScreenWidth(150),
                  decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
              
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(250),
                  width: getProportionateScreenWidth(150),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
              
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
                  height: getProportionateScreenWidth(250),
                  width: getProportionateScreenWidth(150),
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/tshirt.png')),
            ],
          ),
          Column(
            children: [
              Container(
                  height: getProportionateScreenWidth(250),
                  width: getProportionateScreenWidth(150),
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/shoes2.png')),
            ],
          ),
        ],
      ),
      

    ]);
  }
}
