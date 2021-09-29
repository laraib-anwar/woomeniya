import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/reviews/rating.dart';

class ReviewsScreen extends StatefulWidget {
  static String routeName = '/reviews';
  @override
  _ReviewsScreen createState() => _ReviewsScreen();
}

class _ReviewsScreen extends State<ReviewsScreen> {
  late int _rating=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Review", style:(TextStyle(color:kPrimaryColor)))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Rating((rating) {
                setState(() {
                  _rating = rating;
                });
              }, 5),
              SizedBox(
                  height: 44,
                  child: (_rating != null && _rating != 0)
                      ? Text("You selected $_rating rating",
                          style: TextStyle(fontSize: 22))
                      : SizedBox.shrink())
            ],
          ),
        ));
  }
}
