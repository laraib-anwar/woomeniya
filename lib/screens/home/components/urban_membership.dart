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

