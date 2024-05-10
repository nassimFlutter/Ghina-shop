import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/flitter_bottom.dart';
import 'package:best_price/core/widgets/not_found_widget.dart';
import 'package:best_price/core/widgets/product_grid_view.dart';
import 'package:best_price/core/widgets/search_field.dart';
import 'package:best_price/feature/category/presentaion/manager/category_product_cubit/category_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCategoryViewBody extends StatelessWidget {
  const ProductCategoryViewBody(
      {super.key, required this.title, required this.id});
  final String title;
  final int id;
  @override
  Widget build(BuildContext context) {
    CategoryProductCubit categoryProductCubit =
        CategoryProductCubit.get(context);
    categoryProductCubit.fetchProductByCategoryId(id);
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: Dimensions.dStartPadding.w,
          end: Dimensions.dStartPadding.w,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding:
                  EdgeInsetsDirectional.only(top: Dimensions.dTopPadding.h),
              child: AppBarRow(iconPath: IconsPath.arrowLeftIcon, title: title),
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 21.h,
              ),
            ),
            BlocConsumer<CategoryProductCubit, CategoryProductState>(
              listener: (context, state) {},
              builder: (context, state) {
                return SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                          child: SearchField(
                        controller: categoryProductCubit.searchController,
                        onChanged: (p0) {
                          categoryProductCubit.searchProductByName(p0);
                          print(categoryProductCubit
                              .productCategoryResponse.items?.first.products);
                          print(p0);
                        },
                      )),
                      SizedBox(
                        width: 6.w,
                      ),
                      const FlitterBottom()
                    ],
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 14.h,
              ),
            ),
            BlocBuilder<CategoryProductCubit, CategoryProductState>(
              builder: (context, state) {
                if (state is CategoryProductFailure) {
                  return SliverToBoxAdapter(child: Text(state.errMessage));
                } else if (state is CategoryProductLoading) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CustomCircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (categoryProductCubit.searchResult.isEmpty) {
                    return const SliverFillRemaining(
                        child: Center(child: NoResult(title: 'no product')));
                  } else {
                    return ProductGridView(
                        productList: categoryProductCubit.searchResult);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
