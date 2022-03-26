import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/providers/app_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_app/start.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/utils/firebase_messaging_service.dart';
import 'package:shop_app/utils/router_service.dart';
import 'package:shop_app/utils/user_service.dart';

void main() async {
  CurrentUserService _currentUserService = CurrentUserService();
  WidgetsFlutterBinding.ensureInitialized();
  User user;
  // user = await _currentUserService.getCurrentUser();
  await FirebaseMessagingService().initialise();
  Firebase.initializeApp();
  runApp(MyApp(
    currentUser: user,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  RouterService _routerService = RouterService();
  User currentUser;
  MyApp({this.currentUser});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(currentUser, [], null, null, null),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        // home: SplashScreen(),
        // We use routeName so that we dont need to remember the name
        builder: (BuildContext context, Widget child) {
          /// make sure that loading can be displayed in front of all other widgets
          return FlutterEasyLoading(child: child);
        },
        home: Start(),
        navigatorKey: _routerService.navigationKey,
        onGenerateRoute: _routerService.generateRoutes,
      ),
    );
  }
}
