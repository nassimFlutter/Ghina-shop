import 'package:best_price/feature/home/presentation/view/widgets/shimmer_products_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerProductsList extends StatelessWidget {
  const ShimmerProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.h,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ShimmerProductsItem();
        },
      ),
    );
  }
}
