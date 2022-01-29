import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingHelper {
  Color backgroundColor;
  EasyLoadingHelper({this.backgroundColor}) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.chasingDots
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..backgroundColor = backgroundColor
      ..indicatorColor = Colors.white
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..progressColor = Colors.white
      ..textColor = Colors.white;
  }
  void show({@required String text}) {
    EasyLoading.show(status: text);
  }

  void showProgress({@required double value, @required String text}) {
    EasyLoading.showProgress(value, status: text);
  }

  void dismiss() {
    EasyLoading.dismiss();
  }
}