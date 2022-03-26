import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInPhoneScreen extends StatelessWidget {
  static String routeName = "/sign_in_phone";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In with Phone"),
      ),
      body: Body(),
    );
  }
}
