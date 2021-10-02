import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/add_to_cart.dart';
import 'package:shop_app/screens/details/components/cart_counter.dart';
import 'package:shop_app/screens/details/components/counter_with_fav_button.dart';
import 'package:shop_app/screens/details/components/details_offer.dart';
import 'package:shop_app/screens/details/components/product_size.dart';
import 'package:shop_app/screens/reviews/reviews.dart';
import 'package:shop_app/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                // pressOnSeeMore: () {},
              ),
              Divider(thickness: 5.0,),
              ColorDots(product: product),
              SizedBox(height: 20 / 2),
              Divider(
                thickness: 5.0,
              ),
              ProductSize(),
              Divider(
                thickness: 5.0,
              ),
              DetailsOffer(),
              Divider(
                thickness: 5.0,
              ),

              Padding(padding: EdgeInsets.all( 15),
              
              child: CounterWithFavBtn(),),
              
              SizedBox(height: 20
               / 2),
              AddToCart(product: product),
              SizedBox(height: 20 / 2),
              Divider(
                thickness: 5.0,
              ),
            Text('Reviews', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,color:Colors.teal, fontSize: 30),)
        //       TopRoundedContainer(
        //         color: Color(0xFFF6F7F9),
        //         child: Column(
        //           children: [
        //             ColorDots(product: product),
        //             TopRoundedContainer(
        //               color: Colors.white,
        //               child: Padding(
        //                 padding: EdgeInsets.only(
        //                   left: SizeConfig.screenWidth * 0.15,
        //                   right: SizeConfig.screenWidth * 0.15,
        //                   bottom: getProportionateScreenWidth(40),
        //                   top: getProportionateScreenWidth(15),
        //                 ),
                         
        //               // child: SizedBox(height: 20 / 2),
        //                 child: DefaultButton(
        //                   text: "Add To Cart",
        //                   press: () {
        //                     CartCounter();
        //                   },
        //                 ),
        //               ),
        //             ),
        //             TopRoundedContainer(
        //               color: Colors.white,
        //               child: Padding(
        //                 padding: EdgeInsets.only(
        //                   left: SizeConfig.screenWidth * 0.15,
        //                   right: SizeConfig.screenWidth * 0.15,
        //                   bottom: getProportionateScreenWidth(40),
        //                   top: getProportionateScreenWidth(15),
        //                 ),
        //                 child: DefaultButton(
        //                   text: "Add Review",
        //                   press: () {
        //                     Navigator.pushNamed(
        //                         context, ReviewsScreen.routeName);
        //                   },
        //                 ),
        //               ),
        //             ),
                    
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    ))]);
  }
}
