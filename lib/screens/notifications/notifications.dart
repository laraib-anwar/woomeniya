import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/notifications/widgets.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = '/notifications';
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final double _borderRadius = 24;

  var items = [
    PlaceInfo('Note 1', Colors.teal, Colors.yellow,
        'Cosy · Casual · Good for kids'),
    PlaceInfo('Note 2', kPrimaryColor, kSecondaryColor, 
         'All you can eat · Casual · Groups'),
    PlaceInfo('Note 3', kPrimaryColor, kSecondaryColor, 
       'Casual · Groups'),
    PlaceInfo('Note 4', kPrimaryColor,
      kSecondaryColor, 
        'Dubai', ),
    PlaceInfo('Note 5', kPrimaryColor, kSecondaryColor, 
         '...'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(color: kPrimaryColor),),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      gradient: LinearGradient(colors: [
                        items[index].startColor,
                        items[index].endColor
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: items[index].endColor,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: CustomPaint(
                      size: Size(100, 150),
                      painter: CustomCardShapePainter(_borderRadius,
                          items[index].startColor, items[index].endColor),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: <Widget>[
                        
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                     padding: const EdgeInsets.all(15.0),
                          child:    Text(
                                
                                items[index].name,
                                
                                style: TextStyle(
                                  
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w700),
                              )),
                              Padding(
  padding: const EdgeInsets.all( 20.0),
                             child: Text(
                                items[index].category,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Avenir',
                                ),
                              )),
                              SizedBox(height: 16),
                              
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlaceInfo {
  final String name;
  final String category;
 
  
  final Color startColor;
  final Color endColor;

  PlaceInfo(this.name, this.startColor, this.endColor, 
       this.category);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

   
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
