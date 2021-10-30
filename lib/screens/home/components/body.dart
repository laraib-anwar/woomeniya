import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/bottom_wear.dart';
import 'package:shop_app/screens/home/components/design_vote.dart';
import 'package:shop_app/screens/home/components/explore_now.dart';
import 'package:shop_app/screens/home/components/feature_brand.dart';
import 'package:shop_app/screens/home/components/made_in_india.dart';
import 'package:shop_app/screens/home/components/top_wear.dart';
import 'package:shop_app/screens/home/components/trending.dart';
import 'package:shop_app/screens/home/components/message_community.dart';
import 'package:shop_app/screens/home/components/biggest_offer.dart';
import 'package:shop_app/screens/home/components/buy_two.dart';
import 'package:shop_app/screens/home/components/budget.dart';
import 'package:shop_app/screens/home/components/local_vocal.dart';
import 'package:shop_app/screens/home/components/best_offer.dart';
import 'package:shop_app/screens/home/components/local_production.dart';
import 'package:shop_app/screens/home/components/monthly_style.dart';
import 'package:shop_app/screens/home/components/coupon.dart';
import 'package:shop_app/screens/home/components/drop_down.dart';
import 'package:shop_app/screens/home/components/new_arrival.dart';
import 'package:shop_app/screens/home/components/urban_membership.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'deals.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'categories.dart';

class Body extends StatelessWidget {
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
