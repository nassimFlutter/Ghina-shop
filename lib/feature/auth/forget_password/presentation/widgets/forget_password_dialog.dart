import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/feature/auth/forget_password/presentation/widgets/forget_password_dialog_bottom.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordDialog extends StatelessWidget {
  const ForgetPasswordDialog({
    super.key,
    required this.title,
    required this.contain,
    required this.email,
  });
  // todo : finish translate
  final String title, contain, email;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(10),
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 350.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              title,
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
              contain,
              textAlign: TextAlign.center,
              style: AppStyles.textStyle17w700
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              email,
              style: AppStyles.textStyle17w700.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              S.of(context).happy_shopping__, // "Happy Shopping!!",
              style: AppStyles.textStyle17w700.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 24.h,
            ),
            const ForgetPasswordDialogBottom(),
            SizedBox(
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
