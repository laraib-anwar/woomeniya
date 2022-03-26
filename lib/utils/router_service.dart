import 'package:flutter/material.dart';
import '../models/Category.dart';
import '../screens/accessoriesview/accessories_view.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/checkout/checkout.dart';
import '../screens/complete_profile/complete_profile_screen.dart';
import '../screens/details/details_screen.dart';
import '../screens/forgot_password/forgot_password_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login_success/login_success_screen.dart';
import '../screens/menview/men_view.dart';
import '../screens/notifications/notifications.dart';
import '../screens/otp/otp_screen.dart';
import '../screens/paymentssuccess/payment_success.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/reviews/reviews.dart';
import '../screens/settings/settings.dart';
import '../screens/sign_in/sign_in_screen.dart';
import '../screens/feedback/feedback.dart';
import '../screens/sign_in_phone/sign_in_phone_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/sign_up/sign_up_screen.dart';
import '../screens/womenview/women_view.dart';

class RouterService {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  Route<dynamic> generateRoutes(RouteSettings settings) {
    final List<String> validRoutes = [
      SplashScreen.routeName,
      SignInScreen.routeName,
      SignInPhoneScreen.routeName,
      ForgotPasswordScreen.routeName,
      LoginSuccessScreen.routeName,
      SignUpScreen.routeName,
      CompleteProfileScreen.routeName,
      OtpScreen.routeName,
      HomeScreen.routeName,
      DetailsScreen.routeName,
      CartScreen.routeName,
      FeedBackScreen.routeName,
      NotificationScreen.routeName,
      PaymentSuccessScreen.routeName,
      SettingsScreen.routeName,
      ReviewsScreen.routeName,
      MenScreen.routeName,
      WomenScreen.routeName,
      AccessoriesScreen.routeName,
      CheckoutScreen.routeName,
      ProfileScreen.routeName,
      CategoriesScreen.routeName,
    ];

    PageRouteBuilder<dynamic> customRoutes(
        String route, Map<String, dynamic> args) {
      Category category;
      if (args != null) {
        if (args.containsKey('category')) {
          category = args['category'];
        }
      }
      Map<String, Widget> screens = {
        SplashScreen.routeName: SplashScreen(),
        SignInScreen.routeName: SignInScreen(),
        SignInPhoneScreen.routeName: SignInPhoneScreen(),
        ForgotPasswordScreen.routeName: ForgotPasswordScreen(),
        LoginSuccessScreen.routeName: LoginSuccessScreen(),
        SignUpScreen.routeName: SignUpScreen(),
        CompleteProfileScreen.routeName: CompleteProfileScreen(),
        OtpScreen.routeName: OtpScreen(),
        HomeScreen.routeName: HomeScreen(),
        DetailsScreen.routeName: DetailsScreen(),
        CartScreen.routeName: CartScreen(),
        FeedBackScreen.routeName: FeedBackScreen(),
        NotificationScreen.routeName: NotificationScreen(),
        PaymentSuccessScreen.routeName: PaymentSuccessScreen(),
        SettingsScreen.routeName: SettingsScreen(),
        ReviewsScreen.routeName: ReviewsScreen(),
        MenScreen.routeName: MenScreen(
          product: [],
        ),
        WomenScreen.routeName: WomenScreen(
          product: [],
        ),
        AccessoriesScreen.routeName: AccessoriesScreen(
          product: [],
        ),
        CheckoutScreen.routeName: CheckoutScreen(),
        ProfileScreen.routeName: ProfileScreen(),
        CategoriesScreen.routeName: CategoriesScreen(),
      };

      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => screens[route],
          transitionsBuilder: (_, anim, __, child) => FadeTransition(
                opacity: anim,
                child: child,
              ),
          transitionDuration: Duration(milliseconds: 250));
    }

    if (validRoutes.contains(settings.name)) {
      return customRoutes(settings.name, settings.arguments);
    }
    // else {
    //   return MaterialPageRoute(builder: (_) {
    //     return NotFoundScreen();
    //   });
    // }
  }
}
