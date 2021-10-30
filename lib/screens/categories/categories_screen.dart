import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Subcategory.dart';
import 'package:shop_app/screens/feedback/feedback.dart';

import 'package:shop_app/screens/sign_in_phone/sign_in_phone_screen.dart';

import 'components/body.dart';
import 'components/home_header.dart';
import 'components_accessories/body_accessories.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = "/categories";
  List<Category> categories = [
    Category(id: 1, name: "Topwear", subCategories: [
      Subcategory(id: 1, name: "Shirts", imageUrl: "assets/images/shirt.jpg"),
      Subcategory(
          id: 1, name: "T-Shirts", imageUrl: "assets/images/t_shirt_long.jpg"),
      Subcategory(
          id: 1, name: "Tracksuits", imageUrl: "assets/images/track_black.jpg"),
      Subcategory(
          id: 1,
          name: "Plain T-shirts",
          imageUrl: "assets/images/t_shirt_black.jpg"),
      Subcategory(id: 1, name: "Vest", imageUrl: "assets/images/vest.jpeg")
    ]),
    Category(id: 2, name: "Bottomwear", subCategories: [
      Subcategory(id: 1, name: "Jogger", imageUrl: "assets/images/jogger.jpg"),
      Subcategory(
          id: 1, name: "Boxer", imageUrl: "assets/images/jogger_black.jpg"),
      Subcategory(id: 1, name: "Jeans", imageUrl: "assets/images/jeans.jpg"),
      Subcategory(id: 1, name: "Jacket", imageUrl: "assets/images/jacket.jpg")
    ]),
    Category(id: 3, name: "Winterwear", subCategories: [
      Subcategory(id: 1, name: "Jogger", imageUrl: "assets/images/jogger.jpg"),
      Subcategory(
          id: 1, name: "Boxer", imageUrl: "assets/images/jogger_black.jpg"),
      Subcategory(id: 1, name: "Jacket", imageUrl: "assets/images/jacket.jpg")
    ]),
    Category(id: 4, name: "Footwear", subCategories: [
      Subcategory(id: 1, name: "Jogger", imageUrl: "assets/images/jogger.jpg"),
      Subcategory(id: 1, name: "Jeans", imageUrl: "assets/images/jeans.jpg"),
      Subcategory(id: 1, name: "Jacket", imageUrl: "assets/images/jacket.jpg")
    ]),
    Category(id: 5, name: "Beauty & Hygiene", subCategories: [
      Subcategory(id: 1, name: "Jogger", imageUrl: "assets/images/jogger.jpg"),
      Subcategory(
          id: 1, name: "Boxer", imageUrl: "assets/images/jogger_black.jpg"),
    ]),
    Category(id: 6, name: "Innerwear", subCategories: [
      Subcategory(id: 1, name: "Jogger", imageUrl: "assets/images/jogger.jpg"),
      Subcategory(id: 1, name: "", imageUrl: "assets/images/jacket.jpg")
    ]),
    Category(id: 7, name: "New Arrivals", subCategories: [
      Subcategory(id: 1, name: "Jogger", imageUrl: "assets/images/jogger.jpg"),
      Subcategory(id: 1, name: "Jacket", imageUrl: "assets/images/jacket.jpg")
    ]),
    Category(id: 8, name: "Special", subCategories: [
      Subcategory(id: 1, name: "Jogger", imageUrl: "assets/images/jogger.jpg"),
      Subcategory(
          id: 1, name: "Boxer", imageUrl: "assets/images/jogger_black.jpg"),
      Subcategory(id: 1, name: "Jeans", imageUrl: "assets/images/jeans.jpg"),
    ]),
    Category(id: 9, name: "Regional", subCategories: [
      Subcategory(id: 1, name: "Jogger", imageUrl: "assets/images/jogger.jpg"),
    ]),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: HomeHeader(),
            bottom: TabBar(
              indicatorColor: Colors.teal,
              tabs: [
                Tab(
                  child: Text(
                    'Men',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    'Women',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    'Accessories',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                  ),
                  child: Row(children: [
                    Image(
                        image: AssetImage("assets/images/woomeniya_splash.png"),
                        height: 400),
                  ]),
                ),
                ListTile(
                  title: const Text('Men',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Women',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Accessories',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Refer and earn',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('About',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Feedback',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  onTap: () {
                    Navigator.pushNamed(context, FeedBackScreen.routeName);
                  },
                ),
                ListTile(
                  title: const Text('Logout',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  onTap: () {
                    Navigator.pushNamed(context, SignInPhoneScreen.routeName);
                  },
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            Body(
              categories: categories,
            ),
            Body(
              categories: categories,
            ),
            BodyAccessories(),
          ]),
          bottomNavigationBar:
              CustomBottomNavBar(selectedMenu: MenuState.categories),
        ));
  }
}
