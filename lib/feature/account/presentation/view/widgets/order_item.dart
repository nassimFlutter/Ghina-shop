import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/feature/account/presentation/view/widgets/info_widget_left.dart';
import 'package:best_price/feature/account/presentation/view/widgets/info_widget_right.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({
    super.key,
    required this.orderId,
    required this.date,
    required this.amount,
    required this.statue,
  });
  // todo : finish translate
  final String orderId, date, amount;
  final int statue;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  String getOrderStatusText(int status) {
    switch (status) {
      case 0:
        return S.current.pending; // Assuming you have it in translation
      case 1:
        return S.current.confirmed; // Assuming you have it in translation
      default:
        return S.current.unknown; // Or some default fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 16.w),
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 20.h),
        width: 361.w,
        decoration: ShapeDecoration(
          color: AppColor.containerBackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 26.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InfoWidgetLeft(
                    title: S.of(context).order_ID, //'Order ID',
                    value: widget.orderId,
                  ),
                  const Spacer(),
                  InfoWidgetRight(
                    title: S.of(context).date, //"Date",
                    value: widget.date.substring(0, 10),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InfoWidgetLeft(
                    title: S.of(context).amount, //'Amount',
                    value: widget.amount,
                  ),
                  const Spacer(),
                  Container(
                    width: 138.82.w,
                    height: 50.h,
                    decoration: ShapeDecoration(
                      color: AppColor.yalow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: Text(getOrderStatusText(widget.statue),
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle16w400.copyWith(
                            color: AppColor.black,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
          ],
        ),
      ),
    );
  }
}
