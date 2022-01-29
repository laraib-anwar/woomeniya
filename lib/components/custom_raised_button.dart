import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class CustomRaisedButton extends StatelessWidget {
  String label;
  bool inProgress;
  VoidCallback onPressed;
  double height, minWidth;
  Color backgroundColor;
  CustomRaisedButton(
      {this.label,
      this.inProgress = false,
      this.height,
      this.backgroundColor,
      this.minWidth,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height,
      minWidth: minWidth,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: backgroundColor != null ? backgroundColor : kPrimaryColor,
        child: inProgress
            ? CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Color(0xfff5f5f5)),
              )
            : Text(
                '$label',
                style: TextStyle(color: Colors.white),
              ),
        onPressed: !inProgress ? onPressed : () {},
      ),
    );
  }
}
