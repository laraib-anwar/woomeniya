import 'package:flutter/material.dart';
import 'package:shop_app/screens/feedback/feedback.dart';
import 'package:shop_app/screens/notifications/notifications.dart';
import 'package:shop_app/screens/settings/settings.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/sign_in_phone/sign_in_phone_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
           ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User_Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () =>
                Navigator.pushNamed(context, NotificationScreen.routeName),
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () => Navigator.pushNamed(context, SettingsScreen.routeName),
          ),
          ProfileMenu(
            text: "Feedback",
            icon: "assets/icons/Question mark.svg",
            press: () =>
                Navigator.pushNamed(context, FeedBackScreen.routeName),
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () =>
                Navigator.pushNamed(context, SignInPhoneScreen.routeName),
          ),
        ],
      ),
    );
  }
}
