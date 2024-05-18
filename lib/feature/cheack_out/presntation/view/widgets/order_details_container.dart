import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/feature/cheack_out/presntation/view/widgets/custom_divider.dart';
import 'package:best_price/feature/cheack_out/presntation/view/widgets/details_text.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({
    super.key,
    required this.orderId,
    required this.orderStatue,
    required this.orderDate,
  });
  final String orderId, orderStatue, orderDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.checkoutContainerdecoration(),
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          DetailsText(
            title: S.of(context).order_ID, //"Order ID",
            value: orderId,
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
            value: orderStatue,
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
            value: orderDate,
          ),
          SizedBox(
            height: 25.h,
          )
        ],
      ),
    );
  }
}
