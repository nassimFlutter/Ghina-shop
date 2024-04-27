import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsetsDirectional.only(start: 16.w),
        children: [
          SizedBox(
            height: 4.h,
          ),
          const AppBarRow(title: "My Orders"),
          SizedBox(
            height: 35.h,
          ),
          OrderItem(),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
  });

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
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InfoWidgetLeft(
                    title: 'Order ID',
                    value: 'BPR976EH55',
                  ),
                  Spacer(),
                  InfoWidgetRight(
                    title: "Date",
                    value: "12/5/2025",
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
                  const InfoWidgetLeft(
                    title: 'Amount',
                    value: '1019.800 KD',
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
                    child: const Center(
                      child: Text(
                        'Placed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
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
