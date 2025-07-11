import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/feature/account/data/models/order_model/order_model.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderProducts extends StatelessWidget {
  const OrderProducts({
    super.key,
    required this.products,
    required this.orderId,
  });

  final List<Products> products;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 14.h),
            AppBarRow(
              title: "${S.of(context).order_ID}: $orderId",
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Text(
                  S.of(context).products,
                  style: AppStyles.textStyle18w700,
                ),
                const Spacer(),
                Text(
                  "(${products.length} ${products.length == 1 ? S.of(context).item : S.of(context).items})",
                  style: AppStyles.textStyle16w400.copyWith(
                    color: AppColor.greyOpacity,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColor.containerBackColor,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppColor.greyOpacity.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product placeholder icon/image
                        Container(
                          width: 60.w,
                          height: 60.w,
                          decoration: BoxDecoration(
                            color: AppColor.greyOpacity.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: 30.w,
                            color: AppColor.greyOpacity,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name ?? "Product Name",
                                style: AppStyles.textStyle16w700,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Text(
                                    "${S.of(context).price}: ",
                                    style: AppStyles.textStyle14w400.copyWith(
                                      color: AppColor.greyOpacity,
                                    ),
                                  ),
                                  Text(
                                    "${product.price?.toString() ?? '0'} ",
                                    style: AppStyles.textStyle14w400.copyWith(
                                      color: AppColor.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Text(
                                    "${S.of(context).quantity}: ",
                                    style: AppStyles.textStyle14w400.copyWith(
                                      color: AppColor.greyOpacity,
                                    ),
                                  ),
                                  Text(
                                    product.quantity?.toString() ?? '0',
                                    style: AppStyles.textStyle14w400.copyWith(
                                      color: AppColor.black,
                                    ),
                                  ),
                                ],
                              ),
                              if (product.deliveryCost != null &&
                                  product.deliveryCost != 0) ...[
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    Text(
                                      "${S.of(context).deliveryCost}: ",
                                      style: AppStyles.textStyle14w400.copyWith(
                                        color: AppColor.greyOpacity,
                                      ),
                                    ),
                                    Text(
                                      "${product.deliveryCost?.toString() ?? '0'} \$",
                                      style: AppStyles.textStyle14w400.copyWith(
                                        color: AppColor.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              if (product.deliveryDate != null) ...[
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    Text(
                                      "${S.of(context).deliveryDate}: ",
                                      style: AppStyles.textStyle14w400.copyWith(
                                        color: AppColor.greyOpacity,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        product.deliveryDate
                                                ?.substring(0, 10) ??
                                            '',
                                        style:
                                            AppStyles.textStyle14w400.copyWith(
                                          color: AppColor.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              SizedBox(height: 8.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.corn.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text(
                                  "${S.of(context).total}: ${((product.price ?? 0) * (product.quantity ?? 0)).toStringAsFixed(2)} \$",
                                  style: AppStyles.textStyle12w700.copyWith(
                                    color: AppColor.corn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
