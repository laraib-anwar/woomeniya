import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/feedback/feedback.dart';
import 'package:shop_app/screens/home/components_women/body_women.dart';
import 'package:shop_app/screens/sign_in_phone/sign_in_phone_screen.dart';

import 'components/body.dart';
import 'components/home_header.dart';
import 'components_accessories/body_accessories.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
  length: 3,
  child:Scaffold(
    
    appBar: AppBar(
      
      flexibleSpace: HomeHeader(),
          
            bottom: TabBar(
              indicatorColor: Colors.teal,
              tabs: [
                Tab(
                  child: Text(
                    'Men',
                    style: TextStyle(color: Colors.black, fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ),  
                Tab(
                  child: Text(
                    'Women',
                    style: TextStyle(color: Colors.black, fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    'Accessories',
                    style: TextStyle(color: Colors.black, fontSize: 15,
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
                Image(image: AssetImage("assets/images/woomeniya_splash.png"),height:400),
                   
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
        Body(),
        BodyWomen(),
        BodyAccessories(),
      ]),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    ));
  }
}
