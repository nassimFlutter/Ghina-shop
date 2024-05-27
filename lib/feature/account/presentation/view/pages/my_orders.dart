import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/data/models/order_model/order_model.dart';
import 'package:best_price/feature/account/presentation/manager/order_cubit/order_cubit.dart';
import 'package:best_price/feature/account/presentation/view/pages/order_details.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
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
                    return Expanded(
                      child: ListView.builder(
                        itemCount: orderCubit.orderModel.allOrders?.length,
                        itemBuilder: (context, index) {
                          AllOrder? order =
                              orderCubit.orderModel.allOrders?[index];
                          return InkWell(
                            onTap: () {
                              HelperFunctions.navigateToScreen(
                                  context,
                                  OrderDetails(
                                    orderId: orderCubit
                                            .orderModel.allOrders?[index].id ??
                                        -100,
                                  ));
                            },
                            child: OrderItem(
                              amount: order?.totalCommissionAmount.toString() ??
                                  "0",
                              date: order?.createdAt.toString() ?? "",
                              orderId: order?.id.toString() ?? "",
                              statue: order?.statusName ?? "",
                            ),
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
