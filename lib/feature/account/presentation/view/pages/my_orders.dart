import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/presentation/manager/order_cubit/order_cubit.dart';
import 'package:best_price/feature/account/presentation/view/widgets/order_item.dart';
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
    orderCubit.getAllMyOrder();
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        color: AppColor.corn,
        onRefresh: () async {
          await orderCubit.getAllMyOrder();
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 14.h,
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
                    final orders = orderCubit.orderModel.data?.orders ?? [];

                    if (orders.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child: Text(
                            "لا يوجد طلبات",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          final order = orders[index];
                          return InkWell(
                            onTap: () {
                              // Add your navigation logic here if needed
                            },
                            child: OrderItem(
                              amount:
                                  order.totalPrice?.toStringAsFixed(2) ?? "",
                              date: order.orderedDate?.toString() ?? "",
                              orderId: order.id?.toString() ?? "",
                              statue: order.status ?? 0,
                              deliveryDate: order.deliveryDate,
                              cancelNote: order.cancelNote,
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
