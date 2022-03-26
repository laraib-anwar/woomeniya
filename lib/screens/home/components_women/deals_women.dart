import 'package:flutter/material.dart';

import 'package:shop_app/screens/menview/men_view.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Deals extends StatelessWidget {
  const Deals({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Deals",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                icon: "assets/images/best_offer.jpg",
                text: "Best offers",
                press: () {
                  Navigator.pushNamed(context, MenScreen.routeName);
                },
                col: Colors.cyan,
              ),
              SpecialOfferCard(
                icon: "assets/images/buy_2_get_1.jpg",
                text: "Buy 2 get 1",
                press: () {
                  Navigator.pushNamed(context, MenScreen.routeName);
                },
                col: Colors.yellow,
              ),
              SpecialOfferCard(
                icon: "assets/images/tshirt.png",
                text: "Plain T shirts",
                press: () {},
                col: Colors.indigo,
              ),
              SpecialOfferCard(
                icon: "assets/images/health_and_essential.jpg",
                text: "Health and essentail",
                press: () {
                  Navigator.pushNamed(context, MenScreen.routeName);
                },
                col: Colors.pink,
              ),
              SpecialOfferCard(
                icon: "assets/images/color_months.jpg",
                text: "Colour of month",
                press: () {
                  Navigator.pushNamed(context, MenScreen.routeName);
                },
                col: Colors.purple,
              ),
              SpecialOfferCard(
                icon: "assets/images/design_your_t_shirt.jpg",
                text: "Vote for design",
                press: () {},
                col: Colors.grey,
              ),
              SpecialOfferCard(
                icon: "assets/images/flash_deal.jpg",
                text: "flash deal",
                press: () {
                  Navigator.pushNamed(context, MenScreen.routeName);
                },
                col: Colors.orange,
              ),
              SpecialOfferCard(
                icon: "assets/images/flash_deal.jpg",
                text: "flash deal",
                press: () {
                  Navigator.pushNamed(context, MenScreen.routeName);
                },
                col: Colors.green,
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    this.icon,
    this.text,
    this.press,
    this.col,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;
  final col;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: GestureDetector(
          onTap: press,
          child: SizedBox(
            width: getProportionateScreenWidth(100),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  height: getProportionateScreenWidth(100),
                  width: getProportionateScreenWidth(150),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(icon),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  // child: SvgPicture.asset(icon!),
                ),
                SizedBox(height: 5),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ));
  }
}
