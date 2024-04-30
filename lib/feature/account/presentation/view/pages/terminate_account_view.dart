import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bottom2.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TerminateAccountView extends StatelessWidget {
  const TerminateAccountView({super.key});
// todo : finish translates
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 14.h,
              ),
              Row(
                children: [
                  const AppBarBottom(
                    iconPath: IconsPath.arrowLeftIcon,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    S.of(context).terminate_account, //"Terminate Account",
                    style: AppStyles.textStyle20w700,
                  )
                ],
              ),
              SizedBox(
                height: 56.h,
              ),
              SvgPicture.asset(
                IconsPath.terminateAccountAlert,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 34.h,
              ),
              Text(
                S
                    .of(context)
                    .terminate_message, //'Do you want to terminate your\naccount?',
                style: AppStyles.textStyle18w700,
              ),
              SizedBox(
                height: 22.h,
              ),
              Text(
                  S
                      .of(context)
                      .terminate_note_message, //'By terminating account, You will not be able to recover your account.',
                  style:
                      AppStyles.textStyle16w400.copyWith(color: Colors.black)),
              SizedBox(
                height: 309.h,
              ),
              AppBottom2(
                width: 361,
                color: AppColor.redOpacity,
                title: S
                    .of(context)
                    .terminate_my_accounts, // "Terminate my Accounts",
              ),
              SizedBox(
                height: 88.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
