import 'package:best_price/feature/brands/presntations/view/widgets/brand_item.dart';
import 'package:best_price/feature/home/data/fucker/fucker_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandGridView extends StatelessWidget {
  const BrandGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: FuckerData.brands.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 171.58.w / 102.61.h,
          crossAxisCount: 2,
          mainAxisSpacing: 31.h,
          crossAxisSpacing: 17.w),
      itemBuilder: (context, index) {
        return BrandItem(
          imageUrl: FuckerData.brands[index],
        );
      },
    );
  }
}
