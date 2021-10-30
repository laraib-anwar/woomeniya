import 'package:flutter/material.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('men',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold)),           
          ],
        ),
      ),
    );
  }
}
