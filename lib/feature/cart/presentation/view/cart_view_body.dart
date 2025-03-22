import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/error_widget.dart';
import 'package:best_price/core/widgets/not_found_widget.dart';
import 'package:best_price/feature/cart/data/models/cart_model.dart';
import 'package:best_price/feature/cart/presentation/manager/change_quantity_cubit/change_quantity_cubit.dart';
import 'package:best_price/feature/cart/presentation/manager/my_cart_cubit/my_cart_cubit.dart';
import 'package:best_price/feature/cheack_out/presntation/view/pages/cheackout_view.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_style.dart';
import '../widgets/cart_item.dart';
import '../widgets/custom_row_text.dart';
import '../widgets/intermittent_divider.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    MyCartCubit myCartCubit = MyCartCubit.get(context);
    ChangeQuantityCubit changeQuantityCubit = ChangeQuantityCubit.get(context);
    changeQuantityCubit
        .initializeTextEditingControllers(myCartCubit.myCart.myCart ?? []);
    myCartCubit.getMyCart(context);
    return RefreshIndicator(
      onRefresh: () async {
        await myCartCubit.getMyCart(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 14.h),
                  child: Text(
                    S.of(context).my_cart, //'My Cart',
                    style: AppStyles.textStyle20w700,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              BlocBuilder<MyCartCubit, MyCartState>(
                builder: (context, state) {
                  if (state is MyCartLoading) {
                    return const CustomCircularProgressIndicator();
                  } else if (state is MyCartFailures) {
                    return CustomErrorWidget(
                      onTap: () {
                        myCartCubit.getMyCart(context);
                      },
                    );
                  } else {
                    if (myCartCubit.myCart.myCart!.isEmpty) {
                      return const Center(
                        child: NoResult(title: "no product in cart"),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: myCartCubit.myCart.myCart?.length ?? 0,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20.h,
                            ),
                            itemBuilder: (context, index) => CartItem(
                              id: myCartCubit.myCart.myCart?[index].id ?? -1,
                              quantity:
                                  myCartCubit.myCart.myCart?[index].quantity ??
                                      0,
                              cartProduct:
                                  myCartCubit.myCart.myCart?[index].product ??
                                      Product(),
                            ),
                          ),
                          SizedBox(
                            height: 43.h,
                          ),
                          // CustomRowText(
                          //   text1: S.of(context).sub_total,
                          //   textStyle1: AppStyles.textStyle18w400,
                          //   text2: '1019.800 KD',
                          //   textStyle2: AppStyles.textStyle18w700,
                          // ),
                          // const SizedBox(height: 10),
                          const IntermittentDivider(
                            dashWidth: 3,
                          ),
                          const SizedBox(height: 5),
                          CustomRowText(
                            text1: S.of(context).total,
                            textStyle1: AppStyles.textStyle18w400,
                            text2: myCartCubit.myCart.totalFinally.toString(),
                            textStyle2: AppStyles.textStyle18w700,
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          AppBottom(
                            title: S.of(context).proceed_to_checkout,
                            onTap: () {
                              // HelperFunctions.navigateToScreen(
                              //   context,
                              //   const CheckoutView(),
                              // );
                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                        ],
                      );
                    }
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
