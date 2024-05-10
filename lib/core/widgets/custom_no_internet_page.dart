import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomNoInternetPage extends StatelessWidget {
  const CustomNoInternetPage({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            IconsPath.disconnectedIcon,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 41.h,
        ),
        Text(
          S.of(context).NO_CONNECTION, // "NO CONNECTION",
          style: AppStyles.textStyle16w700.copyWith(color: AppColor.black),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          S
              .of(context)
              .connection_not_found, //  "Connection not found, make sure you are\nconnected to internet",
          style: AppStyles.textStyle16w400,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 163.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          child: AppBottom(
            title: S.of(context).retry, //"Retry",
            onTap: onTap,
          ),
        )
      ],
    );
  }
}
