import 'package:flutter/material.dart';
import 'package:shop_app/models/Subcategory.dart';
import 'package:shop_app/screens/menview/men_view.dart';

class GridItem extends StatelessWidget {
  final Subcategory subcategory;
  GridItem({Key key, this.subcategory}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MenScreen.routeName);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.width * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                subcategory.imageUrl,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                subcategory.name,
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
