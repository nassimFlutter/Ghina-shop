import 'dart:io';
import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HelperFunctions {
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static void navigateToScreenAndRemove(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => screen,
      ),
      (route) {
        return false;
      },
    );
  }

  static void navigateToBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void showCustomDialog(BuildContext context, Widget dialog) {
    showDialog(
      context: context,
      builder: (context) {
        return dialog;
      },
    );
  }

  static void showSnackBar(BuildContext context, SnackBar customSnackBar) {
    ScaffoldMessenger.of(context).showSnackBar(customSnackBar);
  }

  //  void showTopSnackBar(BuildContext context) {
  //    showTopSnackBar(
  //         Overlay.of(context),
  //         padding: EdgeInsets.zero,
  //         const CustomSnackBarWidget(),
  //       );

  // }

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

  static bool isGuest() {
    final value = CacheHelper.getData(key: Keys.kIsGuest);
    return value ?? false;
  }

  static Future<void> clearUserData() async {
    await Future.wait([
      CacheHelper.deleteData(key: Keys.kUserName),
      CacheHelper.deleteData(key: Keys.kUserEmail),
      CacheHelper.deleteData(key: Keys.kUserMobile),
      CacheHelper.deleteData(key: Keys.kUserToken),
    ]);
  }
}
