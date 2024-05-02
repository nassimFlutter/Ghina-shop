import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/app_bottom2.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class TowBottomRow extends StatelessWidget {
  const TowBottomRow({
    super.key,
  });
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBottom2(),
        AppBottom(
          title: S.of(context).sign_up, //"Sign Up",
          height: 50,
          // width: 171,
        )
      ],
    );
  }
}
