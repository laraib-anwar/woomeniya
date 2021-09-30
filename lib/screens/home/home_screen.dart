import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/feedback/feedback.dart';
import 'package:shop_app/screens/sign_in_phone/sign_in_phone_screen.dart';

import 'components/body.dart';
import 'components/home_header.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
  length: 4,
  child:Scaffold(
    
    appBar: AppBar(
      
      flexibleSpace: HomeHeader(),
          
            bottom: TabBar(
              indicatorColor: Colors.teal,
              tabs: [
                Tab(
                  child: Text(
                    'Men',
                    style: TextStyle(color: Colors.black, fontSize: 11,
                        fontWeight: FontWeight.w900),
                  ),
                ),  
                Tab(
                  child: Text(
                    'Women',
                    style: TextStyle(color: Colors.black, fontSize: 11,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    'Accessories',
                    style: TextStyle(color: Colors.black, fontSize: 11,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(child: Text('Footwear', style: TextStyle(color:Colors.black, fontSize: 11,
                        fontWeight: FontWeight.w900),),),
              ],
            ),
          ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Text('Woomeniya',
                  style: TextStyle(fontSize: 20.0, color: kSecondaryColor,
                          fontWeight: FontWeight.w900)),
            ),
            ListTile(
              title: const Text('Logout',style: TextStyle(fontSize: 16.0, color: Colors.black,
                          fontWeight: FontWeight.w900)),
              onTap: () {
                Navigator.pushNamed(context, SignInPhoneScreen.routeName);
              },
            ),
            ListTile(
              title: const Text('Men',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900)),
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
                          fontWeight: FontWeight.w900)),
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
                          fontWeight: FontWeight.w900)),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Footwear',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900)),
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
                          fontWeight: FontWeight.w900)),
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
                          fontWeight: FontWeight.w900)),
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
                          fontWeight: FontWeight.w900)),
              onTap: () {
                Navigator.pushNamed(context, FeedBackScreen.routeName);
              },
            ),
          ],
        ),
      ),
      body: TabBarView(children: [
        Body(),
        Body(),
        Body(),
        Body(),

      ]),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    ));
  }
}
