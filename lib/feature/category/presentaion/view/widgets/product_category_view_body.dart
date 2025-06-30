import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/error_widget.dart';
import 'package:best_price/core/widgets/not_found_widget.dart';
import 'package:best_price/core/widgets/paginated_product_grid_view.dart';
import 'package:best_price/core/widgets/search_field.dart';
import 'package:best_price/feature/category/presentaion/manager/category_product_cubit/category_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCategoryViewBody extends StatefulWidget {
  const ProductCategoryViewBody(
      {super.key, required this.title, required this.id});
  final String title;
  final int id;

  @override
  State<ProductCategoryViewBody> createState() =>
      _ProductCategoryViewBodyState();
}

class _ProductCategoryViewBodyState extends State<ProductCategoryViewBody> {
  @override
  void initState() {
    super.initState();
    // Initialize data loading
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CategoryProductCubit.get(context).fetchProductByCategoryId(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    CategoryProductCubit categoryProductCubit =
        CategoryProductCubit.get(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: Dimensions.dStartPadding.w,
          end: Dimensions.dStartPadding.w,
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            categoryProductCubit.resetPagination();
            await categoryProductCubit.fetchProductByCategoryId(widget.id);
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent - 200) {
                if (categoryProductCubit.hasMoreData &&
                    !categoryProductCubit.isLoadingMore) {
                  categoryProductCubit.loadMoreProducts(widget.id);
                }
              }
              return false;
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Padding(
                  padding:
                      EdgeInsetsDirectional.only(top: Dimensions.dTopPadding.h),
                  child: AppBarRow(
                      iconPath: IconsPath.arrowLeftIcon, title: widget.title),
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
                              // print(categoryProductCubit
                              //     .productCategoryResponse.items?.first.products);
                            },
                          )),
                          SizedBox(
                            width: 6.w,
                          ),
                          // const FlitterBottom()
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
                      return SliverFillRemaining(child: CustomErrorWidget(
                        onTap: () {
                          categoryProductCubit
                              .fetchProductByCategoryId(widget.id);
                        },
                      ));
                    } else if (state is CategoryProductLoading) {
                      return const SliverFillRemaining(
                        child: Center(
                          child: CustomCircularProgressIndicator(),
                        ),
                      );
                    } else {
                      if (categoryProductCubit.searchResult.isEmpty) {
                        return const SliverFillRemaining(
                            child:
                                Center(child: NoResult(title: 'no product')));
                      } else {
                        return PaginatedProductGridView(
                          productList: categoryProductCubit.searchResult,
                          hasMoreData: categoryProductCubit.hasMoreData,
                          isLoadingMore: categoryProductCubit.isLoadingMore,
                          onLoadMore: () =>
                              categoryProductCubit.loadMoreProducts(widget.id),
                        );
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
