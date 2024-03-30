import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_style.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 14.h),
                child: Text(
                  'My Cart',
                  style: AppStyles.textStyle20w700,
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              separatorBuilder: (context, index) => SizedBox(
                height: 20.h,
              ),
              itemBuilder: (context, index) => const CartItem(),
            ),
            SizedBox(
              height: 43.h,
            ),
            CustomRowText(
              text1: 'Sub Total',
              textStyle1: AppStyles.textStyle18w400,
              text2: '1019.800 KD',
              textStyle2: AppStyles.textStyle18w700,
            ),
            const SizedBox(height: 10),
            const IntermittentDivider(
              dashWidth: 3,
            ),
            const SizedBox(height: 5),
            CustomRowText(
              text1: 'Total',
              textStyle1: AppStyles.textStyle18w400,
              text2: '1019.800 KD',
              textStyle2: AppStyles.textStyle18w700,
            ),
            AppBottom(
              title: "Proceed to Checkout",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRowText extends StatelessWidget {
  const CustomRowText({
    super.key,
    required this.text1,
    required this.text2,
    required this.textStyle1,
    required this.textStyle2,
  });
  final String text1;
  final String text2;
  final TextStyle textStyle1;
  final TextStyle textStyle2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1, //'Sub Total',
          style: textStyle1, //AppStyles.textStyle18w400,
        ),
        Expanded(
          child: Text(
            text2, //'1019.800 KD',
            style: textStyle2, //AppStyles.textStyle18w700,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

class IntermittentDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const IntermittentDivider({
    super.key,
    this.height = 1,
    this.color = Colors.black,
    this.dashWidth = 5,
    this.dashSpace = 5,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final int dashCount = (width / (dashWidth + dashSpace)).floor();
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            dashCount,
            (_) => SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            ),
          ),
        );
      },
    );
  }
}

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
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.amber,
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

class CustomEditQuantity extends StatelessWidget {
  const CustomEditQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomEditButton(
          color: AppColor.greyOpacity,
          onTap: () {},
          child: const Icon(
            Icons.remove,
          ),
        ),
        SizedBox(
          width: 42,
          child: Center(
            child: Text(
              '01',
              style: AppStyles.textStyle16w700.copyWith(
                color: AppColor.black,
              ),
            ),
          ),
        ),
        CustomEditButton(
          color: AppColor.corn,
          onTap: () {},
          child: const Icon(
            Icons.add,
          ),
        ),
      ],
    );
  }
}

class CustomEditButton extends StatelessWidget {
  const CustomEditButton({
    super.key,
    required this.color,
    this.onTap,
    required this.child,
  });
  final Color color;
  final void Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(
        Dimensions.dBorderRadios,
      ),
      color: color,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          Dimensions.dBorderRadios,
        ),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.dBorderRadios,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
