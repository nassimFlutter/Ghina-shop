import 'package:best_price/feature/brands/presntations/manager/brands_cubit/brands_cubit.dart';
import 'package:best_price/feature/brands/presntations/view/widgets/brand_item.dart';
import 'package:best_price/feature/brands/presntations/view/widgets/shimmer_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandGridView extends StatelessWidget {
  const BrandGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BrandsCubit brandsCubit = BrandsCubit.get(context);
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        return GridView.builder(
          itemCount: brandsCubit.brandResponse.items?.length ?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 171.58.w / 102.61.h,
              crossAxisCount: 2,
              mainAxisSpacing: 31.h,
              crossAxisSpacing: 17.w),
          itemBuilder: (context, index) {
            return BrandItem(
              imageUrl:
                  brandsCubit.brandResponse.items?[index].image ?? "No Name",
            );
          },
        );
      },
    );
  }
}
