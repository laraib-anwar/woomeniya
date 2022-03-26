import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';
import 'screens/home/home_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'utils/local_storage.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  LocalStorageService _localStorageService = LocalStorageService();
  Future checkFirstOpen() async{
    bool firstOpen = await _localStorageService.getBool('firstOpen');
    if(firstOpen == null || firstOpen == true) {
      await _localStorageService.setBool('firstOpen', false);
      Navigator.of(context).pushReplacementNamed(SplashScreen.routeName);
    }
    else {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  @override
  void initState() {
    checkFirstOpen();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
