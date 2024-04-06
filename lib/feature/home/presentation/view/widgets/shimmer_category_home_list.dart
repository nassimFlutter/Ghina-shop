import 'package:best_price/feature/home/presentation/view/widgets/simmer_category_home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryHomeList extends StatelessWidget {
  const ShimmerCategoryHomeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300] ?? const Color(0xff0e0e0e),
        highlightColor: Colors.grey[100] ?? const Color(0xff0e0e0e),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SimmerCategoryHomeItem();
          },
        ),
      ),
    );
  }
}
