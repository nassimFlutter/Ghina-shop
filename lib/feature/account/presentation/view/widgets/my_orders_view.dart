import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/data/models/order_model/order_model.dart';
import 'package:best_price/feature/account/presentation/manager/order_cubit/order_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    OrderCubit orderCubit = OrderCubit.get(context);
    return Scaffold(
      body: RefreshIndicator(
        color: AppColor.buddhaGold,
        onRefresh: () async {
          await orderCubit.getAllMyOrder();
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 4.h,
              ),
              AppBarRow(
                title: S.of(context).my_orders, //"My Orders",
              ),
              SizedBox(
                height: 35.h,
              ),
              BlocConsumer<OrderCubit, OrderState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is OrderLoading) {
                    return const Center(
                      child: CustomCircularProgressIndicator(),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: orderCubit.orderModel.allOrders?.length,
                        itemBuilder: (context, index) {
                          AllOrder? order =
                              orderCubit.orderModel.allOrders?[index];
                          return OrderItem(
                            amount:
                                order?.totalCommissionAmount.toString() ?? "0",
                            date: order?.createdAt.toString() ?? "",
                            orderId: order?.id.toString() ?? "",
                            statue: order?.status.toString() ?? "",
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.orderId,
    required this.date,
    required this.amount,
    required this.statue,
  });
  // todo : finish translate
  final String orderId, date, amount, statue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 16.w),
      child: Container(
        width: 361.w,
        decoration: ShapeDecoration(
          color: AppColor.containerBackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
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
                    value: orderId,
                  ),
                  const Spacer(),
                  InfoWidgetRight(
                    title: S.of(context).date, //"Date",
                    value: date.substring(0, 10),
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
                    value: amount,
                  ),
                  const Spacer(),
                  Container(
                    width: 138.82.w,
                    height: 50.h,
                    decoration: ShapeDecoration(
                      color: AppColor.yalow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        statue,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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

class InfoWidgetLeft extends StatelessWidget {
  const InfoWidgetLeft({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle18w700.copyWith(color: AppColor.silver),
        ),
        Text(value, style: AppStyles.textStyle16w400),
      ],
    );
  }
}

class InfoWidgetRight extends StatelessWidget {
  const InfoWidgetRight({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: AppStyles.textStyle18w700.copyWith(color: AppColor.silver),
        ),
        Text(value, style: AppStyles.textStyle16w400)
      ],
    );
  }
}
