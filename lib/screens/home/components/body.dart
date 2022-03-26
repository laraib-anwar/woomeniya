import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/app_provider.dart';
import 'package:shop_app/providers/category_view_model.dart';
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
import 'package:shop_app/screens/home/components/small_banner.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'deals.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'categories.dart';

class Body extends StatefulWidget {
  int categoryId;
  Body({@required this.categoryId});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    AppProvider _appProvider = Provider.of<AppProvider>(context, listen: false);
    if (_appProvider.categoryWiseBanners[widget.categoryId] == null) {
      _appProvider.loadBanners(
          displayLocation: 0, categoryId: widget.categoryId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryViewModel>(
      builder: (context, value, child) => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(
              categoryId: widget.categoryId,
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Deals(
              categoryId: widget.categoryId,
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            SmallBanners(
              banners: value.smallBanners,
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            DesignVote(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Text('Explore Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.0,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: getProportionateScreenWidth(10)),
            ExploreNow(),
            SizedBox(height: getProportionateScreenWidth(30)),
            NewArrival(),
            SizedBox(height: getProportionateScreenWidth(30)),
            FeatureBrand(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Trending(),
            SizedBox(height: getProportionateScreenWidth(30)),
            BuyTwo(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Budget(),
            SizedBox(height: getProportionateScreenWidth(30)),
            BestOffer(),
            SizedBox(height: getProportionateScreenWidth(20)),
            MadeInIndia(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Text('Explore Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.0,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold)),
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
