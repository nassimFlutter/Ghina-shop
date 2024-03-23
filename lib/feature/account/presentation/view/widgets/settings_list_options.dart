import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/feature/account/presentation/view/widgets/option_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'language_bottom_sheet.dart';

class SettingsListOptions extends StatelessWidget {
  const SettingsListOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      // height: 123.h,
      decoration: AppStyles.accountContainerDecoration(),
      child: Column(
        children: [
          SizedBox(
            height: 14.h,
          ),
          OptionItem(
            title: "Notification",
            iconPath: IconsPath.notificationIcon,
            trailing: SizedBox(
              height: 27.h,
              width: 45.01.w,
              child: CupertinoSwitch(
                value: true,
                onChanged: (value) {},
              ),
            ),
          ),
          OptionItem(
              title: "Language",
              onTap: () {
                showLanguageBottomSheet(context);
              },
              iconPath: IconsPath.languageIcon,
              trailing: SizedBox(
                height: 16.h,
                child: Text(
                  "English",
                  style:
                      AppStyles.textStyle16w400.copyWith(color: Colors.black),
                ),
              )),
          SizedBox(
            height: 14.h,
          ),
        ],
      ),
    );
  }

  PersistentBottomSheetController<dynamic> showLanguageBottomSheet(
      BuildContext context) {
    return showBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      builder: (context) {
        return const LanguageBottomSheet();
      },
    );
  }
}
