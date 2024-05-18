import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/app_bottom2.dart';
import 'package:best_price/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:best_price/feature/auth/sign_up/presentation/view/sign_up_view.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TowBottomRow extends StatelessWidget {
  const TowBottomRow({
    super.key,
  });
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBottom2(
          onTap: () {
            HelperFunctions.navigateToScreen(context, const SignUpView());
          },
        ),
        SizedBox(
          width: 19.w,
        ),
        SizedBox(
          width: 171.w,
          child: AppBottom(
            title: S.of(context).sign_up, //"Sign Up",
            height: 50,
            onTap: () {
              HelperFunctions.navigateToScreen(context, const LoginView());
            },
          ),
        )
      ],
    );
  }
}
