import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/screens/accessoriesview/components/body.dart';
import 'package:shop_app/screens/womenview/constants.dart';
import 'package:shop_app/models/TestProduct.dart';
import 'package:shop_app/screens/womenview/components/body.dart';

class AccessoriesScreen extends StatelessWidget {
  final List<TestProduct> product;
  static String routeName = '/accessories_view';

  const AccessoriesScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyAccessories(
        product: demoProducts,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: Colors.red,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: 20 / 2)
      ],
    );
  }
}
