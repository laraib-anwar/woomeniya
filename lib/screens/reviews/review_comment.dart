import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';

class ReviewComment extends StatelessWidget {


  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Comment",
        hintText: "Enter your comment",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Bell.svg"),
            
      ),
    );
  }
}
