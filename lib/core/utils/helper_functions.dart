import 'dart:io';
import 'package:flutter/material.dart';

class HelperFunctions {
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }

  static void showCustomDialog(BuildContext context, Widget dialog) {
    showDialog(
      context: context,
      builder: (context) {
        return dialog;
      },
    );
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isIos() {
    return Platform.isIOS;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getBottomNavigationBarHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double paddingBottom = MediaQuery.of(context).padding.bottom;

    double visibleHeight = screenHeight - paddingBottom;

    return visibleHeight;
  }
}
