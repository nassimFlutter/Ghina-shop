import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:best_price/generated/l10n.dart'; // Import localization

class CopyRightsWidgets extends StatelessWidget {
  const CopyRightsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(S.of(context).version, // Localized version text
            textAlign: TextAlign.center,
            style: AppStyles.textStyle16w400
                .copyWith(color: AppColor.brownOpacity)),
        SizedBox(
          height: 7.h,
        ),
        Text(S.of(context).copyrights, // Localized copyright text
            textAlign: TextAlign.center,
            style: AppStyles.textStyle16w400
                .copyWith(color: AppColor.brownOpacity)),
        SizedBox(
          height: 7.h,
        ),
      ],
    );
  }
}
