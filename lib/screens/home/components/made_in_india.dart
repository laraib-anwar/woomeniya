import 'package:flutter/material.dart';

import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class MadeInIndia extends StatelessWidget {
  const MadeInIndia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('#Made In India',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 18,
                  height: 2,
                )),
          ],
        ),
        
        
        
             Image.asset(
           'assets/images/Make_in_india.jpg',
           height: 200,
         )
      ]),
      width: MediaQuery.of(context).size.width,
      height: getProportionateScreenWidth(250),
      margin:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5.0)),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
    ));
  }
}
