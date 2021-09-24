import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
              
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child :GestureDetector(
      onTap: press,
      child: 
      SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 10),
            Text(text!, textAlign: TextAlign.center),
          ],
        ),
      ),
      
      )
    );
  }
}
