import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CopyRightsWidgets extends StatelessWidget {
  const CopyRightsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('V.1.0',
            textAlign: TextAlign.center,
            style: AppStyles.textStyle16w400
                .copyWith(color: AppColor.brownOpacity)),
        SizedBox(
          height: 7.h,
        ),
        Text('© 2023 Best Price. All rights reserved',
            textAlign: TextAlign.center,
            style: AppStyles.textStyle16w400
                .copyWith(color: AppColor.brownOpacity)),
        SizedBox(
          height: 7.h,
        ),
        Text('Powered By Line',
            textAlign: TextAlign.center,
            style: AppStyles.textStyle16w400
                .copyWith(color: AppColor.brownOpacity)),
      ],
    );
  }
}
