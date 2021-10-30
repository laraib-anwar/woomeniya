import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components_women/bottom_wear_women.dart';
import 'package:shop_app/screens/home/components_women/design_vote_women.dart';
import 'package:shop_app/screens/home/components_women/explore_now_women.dart';
import 'package:shop_app/screens/home/components_women/feature_brand_women.dart';
import 'package:shop_app/screens/home/components_women/top_wear_women.dart';
import 'package:shop_app/screens/home/components_women/trending_women.dart';
import 'package:shop_app/screens/home/components_women/message_community_women.dart';
import 'package:shop_app/screens/home/components_women/biggest_offer_women.dart';
import 'package:shop_app/screens/home/components_women/buy_two_women.dart';
import 'package:shop_app/screens/home/components_women/budget_women.dart';
import 'package:shop_app/screens/home/components_women/local_vocal_women.dart';
import 'package:shop_app/screens/home/components_women/best_offer_women.dart';
import 'package:shop_app/screens/home/components_women/local_production_women.dart';
import 'package:shop_app/screens/home/components_women/monthly_style_women.dart';
import 'package:shop_app/screens/home/components_women/coupon_women.dart';
import 'package:shop_app/screens/home/components_women/drop_down_women.dart';
import 'package:shop_app/screens/home/components_women/new_arrival_women.dart';
import 'package:shop_app/screens/home/components_women/urban_membership_women.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:shop_app/screens/home/components_women/deals_women.dart';
import 'package:shop_app/screens/home/components_women/discount_banner_women.dart';

import 'package:shop_app/screens/home/components_women/popular_product_women.dart';
import 'package:shop_app/screens/home/components_women/categories_women.dart';

import 'made_in_india.dart';

class BodyWomen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: getProportionateScreenHeight(20)),
            // HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            SizedBox(height: getProportionateScreenHeight(20)),
            UrbanMembership(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Deals(),
            SizedBox(height: getProportionateScreenWidth(50)),
            
            Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DesignVote(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Text('Explore Now',textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, color: kPrimaryColor, fontWeight: FontWeight.bold)),
            SizedBox(height: getProportionateScreenWidth(10)),
            ExploreNow(),
            SizedBox(height: getProportionateScreenWidth(30)),
            NewArrival(),
            SizedBox(height: getProportionateScreenWidth(30)),
            FeatureBrand(),
            SizedBox(height: getProportionateScreenWidth(30)),
            TopWear(),
            SizedBox(height: getProportionateScreenWidth(30)),
            BottomWear(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Trending(),
            SizedBox(height: getProportionateScreenWidth(30)),
            MessageCommunity(),
            SizedBox(height: getProportionateScreenWidth(30)),
            BiggestOffer(),
            SizedBox(height: getProportionateScreenWidth(30)),
            BuyTwo(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Budget(),
            SizedBox(height: getProportionateScreenWidth(20)),
            Coupon(),
            SizedBox(height: getProportionateScreenWidth(30)),
            LocalVocal(),
            SizedBox(height: getProportionateScreenWidth(30)),
            BestOffer(),
            SizedBox(height: getProportionateScreenWidth(30)),
            LocalProduction(),
            SizedBox(height: getProportionateScreenWidth(20)),
            MadeInIndia(),
            SizedBox(height: getProportionateScreenWidth(30)),
            MonthlyStyle(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Text('Explore Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold
                )),
                SizedBox(height: getProportionateScreenWidth(10)),
            ExploreNow(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            // DropDown(),


          ],
        ),
      ),
    );
  }
}
