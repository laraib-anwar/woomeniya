import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import 'package:shop_app/screens/sign_in_phone/sign_in_phone_screen.dart';
import 'package:shop_app/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Woomeniya, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, SignInPhoneScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shop_app/constants.dart';

// import '../../../size_config.dart';

// class Categories extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> categories = [
//       {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
//       {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
//       {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
//       {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
//       {"icon": "assets/icons/Discover.svg", "text": "More"},
//       {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
//       {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
//       {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
//       {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
//       {"icon": "assets/icons/Discover.svg", "text": "More"},
//     ];
//     return Padding(
//       padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
          
//         children: List.generate(
//           categories.length,
//           (index) => CategoryCard(
//             icon: categories[index]["icon"],
//             text: categories[index]["text"],
//             press: () {},
//           ),
//         ),
//         ),
//       ),
//     );
//   }
// }

// class CategoryCard extends StatelessWidget {
//   const CategoryCard({
//     Key? key,
//     required this.icon,
//     required this.text,
//     required this.press,
//   }) : super(key: key);

//   final String? icon, text;
//   final GestureTapCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: SizedBox(
//         width: getProportionateScreenWidth(55),
//         child: Column(
//           children: [
            
//             Container(
              
//               padding: EdgeInsets.all(getProportionateScreenWidth(15)),
//               height: getProportionateScreenWidth(55),
//               width: getProportionateScreenWidth(55),
//               decoration: BoxDecoration(
//                 color: kPrimaryColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: SvgPicture.asset(icon!),
//             ),
//             SizedBox(height: 20),
//             Text(text!, textAlign: TextAlign.center),
            
            
//           ],
//         ),
//       ),
     
//     );
//   }
// }
