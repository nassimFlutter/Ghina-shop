import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/feature/cheack_out/presntation/view/widgets/custom_divider.dart';
import 'package:best_price/feature/cheack_out/presntation/view/widgets/details_text.dart';
import 'package:best_price/feature/cheack_out/presntation/view/widgets/title_check_page.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconsPath.succescheckOut,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 30.h,
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
                      text: '${S.of(context).your_purchase_was} \n',
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
          Container(
            decoration: checkoutContainerdecoration(),
            child: Column(
              children: [
                DetailsText(
                  title: S.of(context).order_ID, //"Order ID",
                  value: 'BP09211',
                ),
                const CustomDivider(),
                DetailsText(
                  title: S.of(context).order_status, //"Order status",
                  value: 'Placed',
                ),
                const CustomDivider(),
                DetailsText(
                  title: S.of(context).date_and_time, //"Date & Time",
                  value: '23/03/2023 | 10:30am',
                ),
                SizedBox(
                  height: 26.h,
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
            height: 17.h,
          ),
          Container(
            decoration: checkoutContainerdecoration(),
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
          Container(
            decoration: checkoutContainerdecoration(),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          S.of(context).item_name, // "Item Name",
                          style: AppStyles.textStyle16w400
                              .copyWith(color: AppColor.greyText),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          "Sony WH-1000XM4",
                          style: AppStyles.textStyle16w400
                              .copyWith(color: AppColor.black),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          "Apple MacBook\nAir M2 ",
                          style: AppStyles.textStyle16w400
                              .copyWith(color: AppColor.black),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ShapeDecoration checkoutContainerdecoration() {
    return ShapeDecoration(
      color: AppColor.containerBackColor,
      shape: checkoutContainerShape(),
    );
  }

  RoundedRectangleBorder checkoutContainerShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    );
  }
}

class ContainerTextCheckout extends StatelessWidget {
  const ContainerTextCheckout({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 15.w),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: AppStyles.textStyle16w400.copyWith(
          color: AppColor.black,
        ),
      ),
    );
  }
}
