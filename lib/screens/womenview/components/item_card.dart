import 'package:flutter/material.dart';
import 'package:shop_app/models/TestProduct.dart';
import 'package:shop_app/size_config.dart';

import '../constants.dart';

class ItemCard extends StatelessWidget {
  final TestProduct product;
  //final Function press;
  const ItemCard({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: press(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              // For  demo we use fixed height  and width
              // Now we dont need them
              height: 320,
              width: 220,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20 / 4),
            child: Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: Colors.teal[200]),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
