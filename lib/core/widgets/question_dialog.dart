import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionDialog extends StatelessWidget {
  const QuestionDialog({
    super.key,
    required this.title,
    required this.contain,
    this.onTapYes,
  });
  final String title, contain;
  final void Function()? onTapYes;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(10),
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 240.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            SizedBox(
              height: 21.h,
            ),
            Text(
              title,
              style: AppStyles.textStyle24,
            ),
            SizedBox(
              height: 10.h,
            ),
            const SizedBox(width: double.infinity, child: Divider()),
            SizedBox(
              height: 16.h,
            ),
            Text(
              contain,
              textAlign: TextAlign.center,
              style: AppStyles.textStyle17w700
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 119.w,
                    height: 40.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.50.sp),
                          side: const BorderSide(color: AppColor.buddhaGold)),
                    ),
                    child: Center(
                      child: Text('No',
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle17w700
                              .copyWith(color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                GestureDetector(
                  onTap: onTapYes,
                  child: Container(
                    width: 119.w,
                    height: 40.h,
                    decoration: ShapeDecoration(
                      color: AppColor.buddhaGold,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19.50.sp),
                      ),
                    ),
                    child: Center(
                      child: Text('Yes',
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle17w700),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 21.h,
            )
          ],
        ),
      ),
    );
  }
}
