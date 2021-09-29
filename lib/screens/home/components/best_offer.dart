import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class BestOffer extends StatelessWidget {
  const BestOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Best offer of the sale",
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
                icon: "assets/icons/Lock.svg",
                text: "flash deal",
                press: () {},
                col: Colors.cyan,
              ),
              SpecialOfferCard(
                icon: "assets/icons/Phone.svg",
                text: "flash deal",
                press: () {},
                col: Colors.yellow,
              ),
              SpecialOfferCard(
                icon: "assets/icons/FSuccess.svg",
                text: "flash deal",
                press: () {},
                col: Colors.indigo,
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
                col: Colors.pink,
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
                col: Colors.purple,
              ),
              SpecialOfferCard(
                icon: "assets/icons/Heart Icon.svg",
                text: "flash deal",
                press: () {},
                col: Colors.grey,
              ),
              SpecialOfferCard(
                icon: "assets/icons/Gift Icon.svg",
                text: "flash deal",
                press: () {},
                col: Colors.orange,
              ),
              SpecialOfferCard(
                icon: "assets/icons/Game Icon.svg",
                text: "flash deal",
                press: () {},
                col: Colors.green,
              ),
              SpecialOfferCard(
                icon: "assets/icons/Flash Icon.svg",
                text: "flash deal",
                press: () {},
                col: Colors.blue,
              ),
              SpecialOfferCard(
                icon: "assets/icons/Bell.svg",
                text: "flash deal",
                press: () {},
                col: Colors.red,
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
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
    required this.col,
  }) : super(key: key);

  final String? icon, text;
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
                  height: getProportionateScreenWidth(55),
                  width: getProportionateScreenWidth(75),
                  decoration: BoxDecoration(
                    color: col,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(icon!),
                ),
                SizedBox(height: 5),
                Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ));
  }
}
