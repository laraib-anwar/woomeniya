import 'package:flutter/material.dart';

class BodyWomen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Women',
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
