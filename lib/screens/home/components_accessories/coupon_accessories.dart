import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/coupon_slider.dart';
import 'package:shop_app/size_config.dart';

class Coupon extends StatelessWidget {
  const Coupon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment(0.4, 0.4),
      children: [
        
        Column(children: [
        Text(":DISCOVER MORE:", textAlign: TextAlign.center, style: TextStyle(fontSize:30, fontWeight: FontWeight.bold),),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Use coupon WMM 100 at checkout",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Column(children: [
                  Container(width:200,child: Text("START EXPLORING", textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, color:Colors.white)),decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(10),)),
                   Text(
                        "Get 100 off on your first offer",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                ],)
                
                
                
              ],
            )),
            
      ]),
        CouponSlider(),
      ],

      
      
      );
        
      
    
    // return Builder(builder: (BuildContext context) {
     
    // });
  }
}
