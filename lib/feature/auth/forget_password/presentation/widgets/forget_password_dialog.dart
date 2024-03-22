import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/feature/auth/forget_password/presentation/widgets/forget_password_dialog_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordDialog extends StatelessWidget {
  const ForgetPasswordDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(10),
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 320.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Forgot Password",
              style: AppStyles.textStyle24,
            ),
            SizedBox(
              height: 12.h,
            ),
            const SizedBox(width: double.infinity, child: Divider()),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "A password reset link has \nbeen sent to your email",
              textAlign: TextAlign.center,
              style: AppStyles.textStyle17
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "mohammed@gmail.com",
              style: AppStyles.textStyle17.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "Happy Shopping!!",
              style: AppStyles.textStyle17.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 24.h,
            ),
            const ForgetPasswordDialogBottom(),
          ],
        ),
      ),
    );
  }
}
