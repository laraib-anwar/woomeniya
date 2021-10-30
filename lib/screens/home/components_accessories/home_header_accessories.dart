import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/notifications/notifications.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter_accessories.dart';
import 'search_field_accessories.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.all(getProportionateScreenWidth(25),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.only(left: 10),child:Row(
            children:[
                Image(
                    image: AssetImage("assets/images/woomeniya_logo.png"),
                    height: 20),
                Text('...',
                style: TextStyle(fontSize: 14.0, color: Colors.black,fontWeight: FontWeight.w900)),]
          )),
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () => Navigator.pushNamed(context, NotificationScreen.routeName),
          ),
        ],
      ),
    );
  }
}
