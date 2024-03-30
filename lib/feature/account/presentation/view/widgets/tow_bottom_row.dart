import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/app_bottom2.dart';
import 'package:flutter/cupertino.dart';

class TowBottomRow extends StatelessWidget {
  const TowBottomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        AppBottom2(),
        AppBottom(
          title: "Sign Up",
          height: 50,
          // width: 171,
        )
      ],
    );
  }
}
