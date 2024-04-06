import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/ad_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAdList extends StatelessWidget {
  const ShimmerAdList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300] ?? const Color(0xff0e0e0e),
        highlightColor: Colors.grey[100] ?? const Color(0xff0e0e0e),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return AdItem(
              banner: HomeBanner(),
            );
          },
        ),
      ),
    );
  }
}
