import 'package:best_price/feature/brands/presntations/manager/brands_cubit/brands_cubit.dart';
import 'package:best_price/feature/brands/presntations/view/widgets/shimmer_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerBrandGridView extends StatelessWidget {
  const ShimmerBrandGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        return GridView.builder(
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 171.58.w / 102.61.h,
              crossAxisCount: 2,
              mainAxisSpacing: 31.h,
              crossAxisSpacing: 17.w),
          itemBuilder: (context, index) {
            return const ShimmerBrandItem();
          },
        );
      },
    );
  }
}
