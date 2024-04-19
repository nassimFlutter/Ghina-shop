import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/feature/account/presentation/view/widgets/copy_rights_widgets.dart';
import 'package:best_price/feature/account/presentation/view/widgets/options_list_title.dart';
import 'package:best_price/feature/account/presentation/view/widgets/settings_list_options.dart';
import 'package:best_price/feature/account/presentation/view/widgets/support_list_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/my_account_info.dart';
import '../widgets/my_account_options.dart';

class MyAccountViewBody extends StatelessWidget {
  const MyAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsetsDirectional.only(start: 16.w),
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 14.h),
            child: Text('My Account', style: AppStyles.textStyle20w700),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            child: const MyAccountInfo(),
          ),
          SizedBox(
            height: 30.h,
          ),
          const OptionsListTitle(
            title: "My Account",
          ),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            child: const MyAccountOptions(),
          ),
          SizedBox(
            height: 25.h,
          ),
          const OptionsListTitle(
            title: "Settings",
          ),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            child: const SettingsListOptions(),
          ),
          SizedBox(
            height: 25.h,
          ),
          const OptionsListTitle(
            title: "Support",
          ),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            child: const SupportListOptions(),
          ),
          SizedBox(
            height: 23.h,
          ),
          const CopyRightsWidgets(),
          SizedBox(
            height: 19.h,
          ),
        ],
      ),
    );
  }
}
