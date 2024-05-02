import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/category/presentaion/manager/category_cubit/category_cubit.dart';
import 'package:best_price/feature/category/presentaion/view/pages/product_category_view.dart';
import 'package:best_price/feature/category/presentaion/view/widgets/shimmer_category_card.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/category_card.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({
    super.key,
  });
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = CategoryCubit.get(context);
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await categoryCubit.fetchAllCategory();
        },
        color: AppColor.corn,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsetsDirectional.only(
                  top: Dimensions.dTopPadding, start: Dimensions.dStartPadding),
              sliver: SliverToBoxAdapter(
                child: Text(
                  S.of(context).categories, // 'Categories',
                  style: AppStyles.textStyle20w700,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsDirectional.only(
                  end: Dimensions.dStartPadding,
                  start: Dimensions.dStartPadding,
                  bottom: 10.h,
                  top: 35.h),
              sliver: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return SliverGrid.builder(
                        itemCount: 12,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 15.h,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return const ShimmerCategoryCard();
                        });
                  } else {
                    return SliverGrid.builder(
                        itemCount:
                            categoryCubit.categoryResponse.items?.length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 15.h,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            imageUrl: categoryCubit
                                    .categoryResponse.items?[index].image ??
                                "",
                            title: categoryCubit
                                    .categoryResponse.items?[index].name ??
                                "",
                            onTap: () {
                              HelperFunctions.navigateToScreen(
                                  context,
                                  ProductCategoryView(
                                    title: categoryCubit.categoryResponse
                                            .items?[index].name ??
                                        "",
                                    categoryId: categoryCubit.categoryResponse
                                            .items?[index].id ??
                                        -1,
                                  ));
                            },
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
