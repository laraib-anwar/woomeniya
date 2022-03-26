import 'package:flutter/material.dart';

class BodyAccessories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Accessories',
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
