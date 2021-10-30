import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/accessoriesview/accessories_view.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/checkout/checkout.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/menview/men_view.dart';
import 'package:shop_app/screens/notifications/notifications.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/paymentssuccess/payment_success.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/reviews/reviews.dart';
import 'package:shop_app/screens/settings/settings.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/feedback/feedback.dart';
import 'package:shop_app/screens/sign_in_phone/sign_in_phone_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';


import 'screens/categories/categories_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/womenview/women_view.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignInPhoneScreen.routeName: (context) => SignInPhoneScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  FeedBackScreen.routeName: (context) => FeedBackScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  PaymentSuccessScreen.routeName: (context) => PaymentSuccessScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  ReviewsScreen.routeName: (context) => ReviewsScreen(),
  MenScreen.routeName: (context) => MenScreen(product: [],),
  WomenScreen.routeName: (context) => WomenScreen(
        product: [],
      ),
      AccessoriesScreen.routeName: (context) => AccessoriesScreen(
        product: [],
      ),
  
  CheckoutScreen.routeName: (context) => CheckoutScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CategoriesScreen.routeName: (context) => CategoriesScreen(),
};


