import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/cart/data/models/cart_model.dart';
import 'package:best_price/feature/cart/presentation/widgets/custom_edit_quantity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/question_dialog.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartProduct,
  });
  final Product cartProduct;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 8.w,
        end: 8.w,
        top: 8.h,
        bottom: 15.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.greyOpacity,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: cartProduct.image ?? " ",
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  cartProduct.title ?? "No title",
                  style: AppStyles.textStyle18w700,
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    text: cartProduct.discountPrice.toString(),
                    style: AppStyles.textStyle16w700,
                    children: [
                      const TextSpan(text: "   "),
                      TextSpan(
                        text: cartProduct.price.toString(),
                        style: AppStyles.textStyle14w400.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    text: "Size",
                    style: AppStyles.textStyle16w400
                        .copyWith(color: AppColor.greyOpacity),
                    children: [
                      TextSpan(
                        text: ": Large",
                        style: AppStyles.textStyle16w400
                            .copyWith(color: AppColor.black2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    text: "Color",
                    style: AppStyles.textStyle16w400
                        .copyWith(color: AppColor.greyOpacity),
                    children: [
                      TextSpan(
                        text: ": Black",
                        style: AppStyles.textStyle16w400
                            .copyWith(color: AppColor.black2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    text: "Quantity",
                    style: AppStyles.textStyle16w400
                        .copyWith(color: AppColor.greyOpacity),
                    children: [
                      TextSpan(
                        text: ": ${cartProduct.quantity}",
                        style: AppStyles.textStyle16w400
                            .copyWith(color: AppColor.black2),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomEditQuantity(),
                    IconButton(
                      onPressed: () {
                        HelperFunctions.showCustomDialog(
                            context,
                            QuestionDialog(
                              title: "Delete Product",
                              contain:
                                  "Are Your Sure You \nWant to delete Item from Cart",
                              onTapYes: () {},
                            ));
                      },
                      icon: SvgPicture.asset(IconsPath.deleteIcon),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
