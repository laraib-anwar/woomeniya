import 'package:flutter/material.dart';

import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class DetailsOffer extends StatelessWidget {
  const DetailsOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width,
        height: getProportionateScreenWidth(80),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
       
        child:(Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
       Container(
      child: Text('Buy 3 for 399',
      
          textAlign: TextAlign.center,
          
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 18,
            height: 2,
          )),
     
    ),

    Container(width: MediaQuery.of(context).size.width/2,height: getProportionateScreenWidth(20),
    child: Text('View all Items',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 10,
              height: 1,
            )),
            decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)
      ))

    ])));
  }
}
