import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/app_bottom2.dart';
import 'package:best_price/feature/cheack_out/presntation/view/widgets/custom_divider.dart';
import 'package:best_price/feature/cheack_out/presntation/view/widgets/details_text.dart';
import 'package:best_price/feature/cheack_out/presntation/view/widgets/title_check_page.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/container_text_checkout.dart';
import '../widgets/products_tile_text.dart';
import '../widgets/text_in_payment_details_container.dart';

class CheckOutSuccess extends StatelessWidget {
  const CheckOutSuccess({super.key});
// todo : finish translate
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconsPath.succescheckOut,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 37.h,
              ),
              Text(
                S
                    .of(context)
                    .thank_you_for_your_purchase, //'Thank You For Your Purchase',
                style: AppStyles.textStyle20w700,
              ),
              SizedBox(
                height: 26.h,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${S.of(context).your_purchase_was} \n ',
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 24.sp,
                        fontFamily: 'Josefin Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: S.of(context).successful, //'Successful',
                      style: TextStyle(
                        color: AppColor.green,
                        fontSize: 24.sp,
                        fontFamily: 'Josefin Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 45.h,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: TitleCheckPage(
              title: S.of(context).order_details, //"Order Details",
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Container(
            decoration: AppStyles.checkoutContainerdecoration(),
            margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                DetailsText(
                  title: S.of(context).order_ID, //"Order ID",
                  value: 'BP09211',
                ),
                SizedBox(
                  height: 17.h,
                ),
                const CustomDivider(),
                SizedBox(
                  height: 13.h,
                ),
                DetailsText(
                  title: S.of(context).order_status, //"Order status",
                  value: 'Placed',
                ),
                SizedBox(
                  height: 17.h,
                ),
                const CustomDivider(),
                SizedBox(
                  height: 13.h,
                ),
                DetailsText(
                  title: S.of(context).date_and_time, //"Date & Time",
                  value: '23/03/2023 | 10:30am',
                ),
                SizedBox(
                  height: 25.h,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: TitleCheckPage(
              title: S.of(context).delivery_details, //"Delivery Details",
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Container(
            decoration: AppStyles.checkoutContainerdecoration(),
            margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                ContainerTextCheckout(
                  text: S.of(context).home, //"Home",
                ),
                SizedBox(
                  height: 24.h,
                ),
                const ContainerTextCheckout(text: "97887878"),
                SizedBox(
                  height: 24.h,
                ),
                const ContainerTextCheckout(
                    text:
                        "Al Hamra Tower\nAl shuhada street 19th floor, Kuwait City"),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: TitleCheckPage(
              title: S.of(context).products, //"Products ",
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Container(
            decoration: AppStyles.checkoutContainerdecoration(),
            margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(
                  height: 21.h,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductsTileText(text: "Item Name"),
                    ProductsTileText(text: "qty"),
                    ProductsTileText(text: "Price"),
                  ],
                ),
                SizedBox(height: 23.h),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sony WH-1000XM4",
                              style: AppStyles.textStyle16w400
                                  .copyWith(color: AppColor.black),
                            ),
                            Text(
                              "1",
                              style: AppStyles.textStyle16w400
                                  .copyWith(color: AppColor.black),
                            ),
                            Text(
                              "100kd",
                              style: AppStyles.textStyle16w400
                                  .copyWith(color: AppColor.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 21.h,
                        ),
                        const Divider(),
                        SizedBox(
                          height: 21.h,
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: const TitleCheckPage(title: "Payment Details"),
          ),
          SizedBox(
            height: 14.h,
          ),
          Container(
            decoration: AppStyles.  checkoutContainerdecoration(),
            margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                const TextInPaymentDetailsContainer(
                  title: "Payment Method",
                  value: "Knet",
                ),
                SizedBox(
                  height: 17.h,
                ),
                const Divider(),
                SizedBox(
                  height: 13.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 41.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppBottom2(
                title: "Home",
              ),
              SizedBox(
                width: 19.h,
              ),
              SizedBox(
                width: 171.w,
                child: const AppBottom(
                  title: "My Orders",
                ),
              )
            ],
          ),
          SizedBox(
            height: 46.h,
          ),
        ],
      ),
    );
  }
}
