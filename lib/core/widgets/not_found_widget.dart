import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
  });
// todo : finish translate
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
          S.of(context).no_added_address, // "No Added Address",
          style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 18.h,
        ),
        Text(
          S
              .of(context)
              .add_address_for_a_faster_checkout, // "Add Address for a Faster Checkout",
          style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
