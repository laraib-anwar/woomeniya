import 'package:flutter/material.dart';

import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';


import 'item_card.dart';

class BodyAccessories extends StatelessWidget {
  final List<Product> product;

  const BodyAccessories({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Accessories",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  
            ),
          ),
          // Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  itemCount: product.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.60,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                        product: product[index],
                        // press: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => DetailsScreen(
                        //         product: product[index],
                        //       ),
                        //     )),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
