import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/feature/account/presentation/manager/order_cubit/order_cubit.dart';
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
    this.deliveryDate,
    this.cancelNote,
  });
  // todo : finish translate
  final String orderId, date, amount;
  final String? deliveryDate, cancelNote;
  final int statue;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    OrderCubit orderCubit = OrderCubit.get(context);

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
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                          orderCubit.getOrderStatusText(widget.statue, context),
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle16w400.copyWith(
                            fontWeight: FontWeight.w600,
                            color:
                                orderCubit.getOrderStatusColor(widget.statue),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Visibility(
              visible: widget.deliveryDate != null &&
                  widget.deliveryDate!.isNotEmpty &&
                  widget.statue != 3,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: InfoWidgetLeft(
                  title: S.of(context).deliveryDate, //'Amount',
                  value: orderCubit.formatDateTime(widget.deliveryDate),
                ),
              ),
            ),
            Visibility(
              visible: widget.deliveryDate != null &&
                  widget.deliveryDate!.isNotEmpty &&
                  widget.statue != 3,
              child: SizedBox(
                height: 26.h,
              ),
            ),
            Visibility(
              visible: widget.cancelNote != null &&
                  widget.cancelNote!.isNotEmpty &&
                  widget.statue == 3,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: InfoWidgetLeft(
                  title: S.of(context).cancelNote, //'Amount',
                  value: widget.cancelNote ?? "",
                ),
              ),
            ),
            Visibility(
              visible: widget.cancelNote != null &&
                  widget.cancelNote!.isNotEmpty &&
                  widget.statue == 3,
              child: SizedBox(
                height: 26.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
