import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/cheack_out/presntation/view/pages/cheackout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_style.dart';
import '../widgets/cart_item.dart';
import '../widgets/custom_row_text.dart';
import '../widgets/intermittent_divider.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 14.h),
                child: Text(
                  'My Cart',
                  style: AppStyles.textStyle20w700,
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              separatorBuilder: (context, index) => SizedBox(
                height: 20.h,
              ),
              itemBuilder: (context, index) => const CartItem(),
            ),
            SizedBox(
              height: 43.h,
            ),
            CustomRowText(
              text1: 'Sub Total',
              textStyle1: AppStyles.textStyle18w400,
              text2: '1019.800 KD',
              textStyle2: AppStyles.textStyle18w700,
            ),
            const SizedBox(height: 10),
            const IntermittentDivider(
              dashWidth: 3,
            ),
            const SizedBox(height: 5),
            CustomRowText(
              text1: 'Total',
              textStyle1: AppStyles.textStyle18w400,
              text2: '1019.800 KD',
              textStyle2: AppStyles.textStyle18w700,
            ),
            AppBottom(
              title: "Proceed to Checkout",
              onTap: () {
                HelperFunctions.navigateToScreen(context, const CheckoutView());
              },
            ),
            SizedBox(
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
