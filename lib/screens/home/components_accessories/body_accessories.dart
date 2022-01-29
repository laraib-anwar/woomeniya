import 'package:flutter/material.dart';


import 'package:shop_app/screens/home/components_accessories/explore_now_accessories.dart';

import 'package:shop_app/screens/home/components_accessories/top_wear_accessories.dart';

import 'package:shop_app/screens/home/components/buy_two.dart';

import 'package:shop_app/screens/home/components/best_offer.dart';

import 'package:shop_app/screens/home/components/monthly_style.dart';
import 'package:shop_app/screens/home/components/coupon.dart';

import 'package:shop_app/screens/home/components/new_arrival.dart';
import 'package:shop_app/screens/home/components_accessories/urban_membership_accessories.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'deals_accessories.dart';
import 'discount_banner_accessories.dart';

import 'popular_product_accessories.dart';


class BodyAccessories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         
          SizedBox(height: getProportionateScreenWidth(10)),
          
          SizedBox(height: getProportionateScreenWidth(10)),
          DiscountBanner(),
          SizedBox(height: getProportionateScreenHeight(20)),
          UrbanMembership(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Deals(),
          SizedBox(height: getProportionateScreenWidth(30)),
          Text('Explore Now',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22.0, color: kPrimaryColor, fontWeight: FontWeight.bold)),
          SizedBox(height: getProportionateScreenWidth(10)),
          ExploreNow(),
          SizedBox(height: getProportionateScreenWidth(30)),
         
          TopWear(),
          SizedBox(height: getProportionateScreenWidth(30)),
          BuyTwo(),
          
          SizedBox(height: getProportionateScreenWidth(20)),
          Coupon(),
         
          SizedBox(height: getProportionateScreenWidth(30)),
          BestOffer(),
        
          
          SizedBox(height: getProportionateScreenWidth(30)),
          MonthlyStyle(),
          
         
          SizedBox(height: getProportionateScreenWidth(30)),
          PopularProducts(),
          // SizedBox(height: getProportionateScreenWidth(30)),
          // DropDown(),


        ],
      ),
    );
  }
}
