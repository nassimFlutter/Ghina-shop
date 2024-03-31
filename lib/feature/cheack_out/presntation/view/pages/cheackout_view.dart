import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/account/presentation/view/pages/add_address_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/code_failed.dart';
import '../widgets/payment_details_container.dart';
import '../widgets/title_check_page.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CheckoutBody(),
    );
  }
}

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: Dimensions.dStartPadding.w),
      children: [
        const AppBarRow(iconPath: IconsPath.arrowLeftIcon, title: "Checkout"),
        SizedBox(
          height: 32.h,
        ),
        const TitleCheckPage(title: "Address"),
        SizedBox(
          height: 14.h,
        ),
        Container(
          height: 97.49.h,
          decoration: ShapeDecoration(
            color: AppColor.greyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
            child: InkWell(
              onTap: () {
                HelperFunctions.navigateToScreen(
                    context, const AddAddressView());
              },
              child: Text(
                "Add address",
                style: AppStyles.textStyle16w700.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.black,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
        const TitleCheckPage(
          title: "Coupon Code",
        ),
        SizedBox(
          height: 14.h,
        ),
        const CodeFailed(),
        SizedBox(
          height: 45.h,
        ),
        const TitleCheckPage(
          title: "Payment Details",
        ),
        SizedBox(
          height: 14.h,
        ),
        const PaymentDetailsContainer(),
        SizedBox(
          height: 40.h,
        ),
        const AppBottom(title: "Proceed to Pay"),
        SizedBox(
          height: 26.h,
        ),
      ],
    );
  }
}
