import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class ProductSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"text": "S"},
      {"text": "M"},
      {"text": "L"},
      {"text": "XL"},
      {"text": "2XL"},
    ];
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: Column(children: [
          Text("Select your size",
              style:
                  TextStyle(color: Colors.teal, fontWeight: FontWeight.w500)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              categories.length,
              (index) => CategoryCard(
                text: categories[index]["text"],
                press: () {},
              ),
            ),
          ),
        ]));
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(text, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
