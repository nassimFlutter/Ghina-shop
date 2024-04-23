import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/feature/cart/presentation/widgets/custom_edit_quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

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
          const Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage(
                  ImagePath.headPhone,
                ),
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
                  'Sony WH-1000XM4',
                  style: AppStyles.textStyle18w700,
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    text: "100.000 KD",
                    style: AppStyles.textStyle16w700,
                    children: [
                      const TextSpan(text: "   "),
                      TextSpan(
                        text: "100.000 KD",
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
                        text: ": 01",
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
                      onPressed: () {},
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
