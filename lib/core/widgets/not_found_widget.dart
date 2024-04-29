import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          IconsPath.notFound,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          "No Added Address",
          style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 18.h,
        ),
        Text(
          "Add Address for a Faster Checkout",
          style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

class NoResult extends StatelessWidget {
  const NoResult({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          IconsPath.notFound,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 18.h,
        ),
        Text(
          title,
          style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
