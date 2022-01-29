import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/app_provider.dart';
import 'package:shop_app/providers/category_view_model.dart';

import 'package:shop_app/screens/menview/men_view.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Deals extends StatefulWidget {
  final int categoryId;
  const Deals({Key key, @required this.categoryId}) : super(key: key);

  @override
  _DealsState createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  @override
  void initState() {
    AppProvider _appProvider =
        Provider.of<AppProvider>(context, listen: false);
    if (_appProvider.categoryWiseDeals[widget.categoryId] == null) {
      _appProvider.loadDeals(categoryId: widget.categoryId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryViewModel>(
      builder: (context, model, child) => Column(
        children: [
          Text("Deals",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          model.deals != null
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: model.deals
                        .map(
                          (deal) => SpecialOfferCard(
                            icon: "assets/images/best_offer.jpg",
                            text: deal.name,
                            press: () {
                              // Navigator.pushNamed(context, MenScreen.routeName);
                            },
                            col: Colors.cyan,
                          ),
                        )
                        .toList(),
                  ),
                )
              : Container(
                  height: getProportionateScreenWidth(100),
                  width: MediaQuery.of(context).size.width,
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
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
