import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutUnSuccess extends StatelessWidget {
  const CheckOutUnSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 14.h, start: 16.w),
            child: AppBarRow(
              iconPath: IconsPath.arrowLeftIcon,
              title: S.of(context).checkout, // "Checkout",
            ),
          ),
          SizedBox(
            height: 74.h,
          ),
          Column(
            children: [
              SvgPicture.asset(IconsPath.unSuccescheckOut),
              SizedBox(
                height: 37.h,
              ),
              Text(
                "OPPS!",
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 20.sp,
                  fontFamily: 'Josefin Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your Purchase was \n ',
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 24.sp,
                        fontFamily: 'Josefin Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: "Unsuccessful", //'Successful',
                      style: TextStyle(
                        color: AppColor.red,
                        fontSize: 24.sp,
                        fontFamily: 'Josefin Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 74.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sorry!",
                  style: AppStyles.textStyle18w700
                      .copyWith(color: AppColor.black4),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Your Payment Was Unsuccessful",
                  style: AppStyles.textStyle18w700
                      .copyWith(color: AppColor.black4),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "An error occurred while we were \nProcessing your payment",
                  style: AppStyles.textStyle18w400
                      .copyWith(color: AppColor.black4),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Error code: 0x000231",
                  style: AppStyles.textStyle18w700
                      .copyWith(color: AppColor.black4),
                ),
                SizedBox(
                  height: 65.h,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppBottom(title: "Try again"),
          )
        ],
      ),
    );
  }
}
