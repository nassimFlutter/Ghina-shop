import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/feature/home/data/fucker/fucker_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/brand_grid_view.dart';
import '../widgets/brand_item.dart';

class BrandsView extends StatelessWidget {
  const BrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: Dimensions.dTopPadding.h,
                  start: Dimensions.dStartPadding.w),
              child: const AppBarRow(
                  iconPath: IconsPath.arrowLeftIcon, title: "Brands"),
            ),
            SizedBox(height: 40.h),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: Dimensions.dStartPadding.w,
                    end: Dimensions.dStartPadding.w),
                child: const BrandGridView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
