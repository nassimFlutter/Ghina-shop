import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/account/presentation/view/pages/add_address_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAddressView extends StatelessWidget {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: const AppBarRow(
                iconPath: IconsPath.arrowLeftIcon, title: ' My Addresses'),
          ),
          SizedBox(
            height: 44.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppBottom(
              title: "Add New Address",
              onTap: () {
                HelperFunctions.navigateToScreen(
                    context, const AddAddressView());
              },
            ),
          ),
          SizedBox(
            height: 104.h,
          ),
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
      ),
    );
  }
}
