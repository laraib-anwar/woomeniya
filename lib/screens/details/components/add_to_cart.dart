import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/TestProduct.dart';
import 'package:shop_app/screens/reviews/reviews.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    this.product,
  }) : super(key: key);

  final TestProduct product;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 50,
                  width: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Colors.brown,
                    ),
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/add_to_cart.svg",
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 0),
                child: Expanded(
                  child: SizedBox(
                    height: 50,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      color: Colors.grey[200],
                      onPressed: () {},
                      child: Text(
                        "Buy  Now".toUpperCase(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[300],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 0),
                child: Expanded(
                  child: SizedBox(
                    height: 50,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      color: Colors.grey[200],
                      onPressed: () {
                        Navigator.pushNamed(context, ReviewsScreen.routeName);
                      },
                      child: Text(
                        "Add review".toUpperCase(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[300],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]));
  }
}
