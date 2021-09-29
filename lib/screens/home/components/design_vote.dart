import 'package:flutter/material.dart';

import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class DesignVote extends StatelessWidget {
  const DesignVote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Expanded(
        child:Text('Design of the Day',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 18,
            height: 2,
            
          )
          )),
         Expanded( 
          child:TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(kSecondaryColor),
              ),
              onPressed: () {},
              child: Text('Vote Now'),
            ))
      ],),
      width: MediaQuery.of(context).size.width,
      height: getProportionateScreenWidth(60),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(10))));
      
  
}
}
