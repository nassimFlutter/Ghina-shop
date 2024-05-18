import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/feature/cart/data/models/cart_model.dart';
import 'package:best_price/feature/cart/presentation/widgets/cart_item.dart';
import 'package:best_price/feature/cheack_out/presntation/view/pages/checkout_success.dart';
import 'package:best_price/feature/cheack_out/presntation/view/widgets/payment_details_container.dart';
import 'package:best_price/feature/cheack_out/presntation/view/widgets/title_check_page.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cheack_out/presntation/view/widgets/order_details_container.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        children: [
          SizedBox(
            height: 14.h,
          ),
          AppBarRow(
            title: S.of(context).my_orders, //"My Orders",
          ),
          SizedBox(
            height: 51.h,
          ),
          TitleCheckPage(
            title: S.of(context).order_details, //"Address",
          ),
          SizedBox(
            height: 14.h,
          ),
          const OrderDetailsContainer(
            orderId: "1000",
            orderDate: "12-10 |10.00",
            orderStatue: "placed",
          ),
          SizedBox(
            height: 30.h,
          ),
          TitleCheckPage(
            title: S.of(context).delivery_details, //"Address",
          ),
          SizedBox(
            height: 17.5.h,
          ),
          const DeliveryDetails(),
          SizedBox(
            height: 30.h,
          ),
          TitleCheckPage(
            title: S.of(context).products, //"products",
          ),
          SizedBox(
            height: 13.h,
          ),
          CartItem(
            id: 2 ?? -1,
            quantity: 50 ?? 0,
            cartProduct: Product(),
          ),
        ],
      ),
    );
  }
}

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      decoration: ShapeDecoration(
        color: AppColor.containerBackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 14.w),
            child: Text(
              "House",
              style: AppStyles.textStyle18w700,
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 24.w),
            child: Text(
              "+965 87888788",
              style: AppStyles.textStyle16w400.copyWith(color: AppColor.black),
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 13.w),
            child: ExpandableText(
              '${"addressItem.addressName"}, ${"addressItem.street"}, ${"addressItem.floorNumber"}, ${"addressItem.area?.name" ?? ""}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontFamily: 'Josefin Sans',
                fontWeight: FontWeight.w400,
              ),
              expandText: S.of(context).show_more, //'show more',
              collapseText: S.of(context).show_less, //'show less',
              maxLines: 4,
              linkColor: AppColor.silver, // optional
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            height: 24.h,
          )
        ],
      ),
    );
  }
}
