import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/feature/brands/presntations/manager/brands_cubit/brands_cubit.dart';
import 'package:best_price/feature/brands/presntations/view/widgets/shimmer_brand_grid_view.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/brand_grid_view.dart';

class BrandsView extends StatelessWidget {
  const BrandsView({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    BrandsCubit brandsCubit = BrandsCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await brandsCubit.fetchAllBrands();
          },
          color: AppColor.corn,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: Dimensions.dTopPadding.h,
                    start: Dimensions.dStartPadding.w),
                child: AppBarRow(
                  iconPath: IconsPath.arrowLeftIcon,
                  title: S.of(context).brands, //"Brands",
                ),
              ),
              SizedBox(height: 40.h),
              BlocBuilder<BrandsCubit, BrandsState>(
                builder: (context, state) {
                  if (state is BrandsLoading) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: Dimensions.dStartPadding.w,
                            end: Dimensions.dStartPadding.w),
                        child: const ShimmerBrandGridView(),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: Dimensions.dStartPadding.w,
                            end: Dimensions.dStartPadding.w),
                        child: const BrandGridView(),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
