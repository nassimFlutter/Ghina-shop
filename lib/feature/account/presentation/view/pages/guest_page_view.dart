import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/copy_rights_widgets.dart';
import '../widgets/options_list_title.dart';
import '../widgets/settings_list_options.dart';
import '../widgets/support_list_options.dart';
import '../widgets/tow_bottom_row.dart';
class GuestPageView extends StatelessWidget {
  const GuestPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsetsDirectional.only(start: 16.w),
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 14.h),
            child: Text('My Account', style: AppStyles.textStyle20w700),
          ),
          SizedBox(
            height: 42.h,
          ),
          const TowBottomRow(),
          SizedBox(
            height: 42.h,
          ),
          const OptionsListTitle(title: 'Settings'),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            child: const SettingsListOptions(),
          ),
          SizedBox(
            height: 30.h,
          ),
          const OptionsListTitle(title: 'Support'),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            child: const SupportListOptions(),
          ),
          SizedBox(
            height: 13.h,
          ),
          const CopyRightsWidgets()
        ],
      ),
    );
  }
}
