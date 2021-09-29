import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class BiggestOffer extends StatelessWidget {
  const BiggestOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width*0.9,
        child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text('Biggest Offer of the Day',
          textAlign: TextAlign.center, style: TextStyle(color: kPrimaryColor, fontSize: 22,fontWeight: FontWeight.bold)),
      Row(
        
        children: [
          Expanded(
            
          child:Container(
            width: getProportionateScreenWidth(150),
            height: getProportionateScreenWidth(200),
            color: Colors.teal
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: getProportionateScreenWidth(100),
                  width: getProportionateScreenWidth(150),
                  color:kPrimaryLightColor
                  ),
                  Container(
                  height: getProportionateScreenWidth(100),
                  width: getProportionateScreenWidth(150),
                  color:kSecondaryColor
                  )
                 
            ],
          ),
         
          
        ],
      ),
    ]));
  }
}
