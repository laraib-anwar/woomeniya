import 'package:flutter/material.dart';

import 'package:shop_app/constants.dart';

import '../../../size_config.dart';

class UrbanMembership extends StatelessWidget {
  const UrbanMembership({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
      
                    Container(
                      
                      
                       //Text('Urban Memebreship',
            //           textAlign: TextAlign.center,style: TextStyle(
            //   color: Colors.white,
            //   fontWeight: FontWeight.w800,
            //   fontFamily: 'Roboto',
            //   letterSpacing: 0.5,
            //   fontSize: 18,
            //   height: 2,
            // )),
                width: MediaQuery.of(context).size.width,
                height:getProportionateScreenWidth(80),
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
          image: AssetImage(
              'assets/images/urban_membership.png'),
          fit: BoxFit.fill,
        ),
                    borderRadius: BorderRadius.circular(10)),
                )
      
        );
      }
    
  }

