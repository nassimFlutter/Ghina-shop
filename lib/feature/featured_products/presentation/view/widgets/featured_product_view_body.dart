import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/not_found_widget.dart';
import 'package:best_price/feature/featured_products/presentation/manager/featured_products_cubit/featured_products_cubit.dart';
import 'package:best_price/feature/flitter_sort/presentaion/view/pages/flitter_sort_view.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/data/models/home_model.dart';

class FeaturedProductViewBody extends StatelessWidget {
  const FeaturedProductViewBody({super.key});
  // todo : finish translate
  @override
  Widget build(BuildContext context) {
    FeaturedProductsCubit featuredProductsCubit =
        FeaturedProductsCubit.get(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: Dimensions.dStartPadding,
        end: Dimensions.dStartPadding,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: Dimensions.dTopPadding.h,
                end: Dimensions.dStartPadding,
                start: Dimensions.dStartPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppBarRow(
                      iconPath: IconsPath.arrowLeftIcon,
                      title: S
                          .of(context)
                          .featured_products, // "Featured Products",
                      onFirstIconTap: () {
                        HelperFunctions.navigateToBack(context);
                      },
                    ),
                  ),
                  AppBarBottom(
                    iconPath: IconsPath.flitterIcon,
                    onTap: () {
                      // HelperFunctions.navigateToScreen(
                      //     context,
                      //     FlitterSortView(
                      //       endValue:
                      //           featuredProductsCubit.maxProductPrice.toDouble(),
                      //     ));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlitterSortView(
                            endValue: featuredProductsCubit.maxProductPrice
                                .toDouble(),
                            page: "featured",
                          ),
                        ),
                      ).then((value) {
                        if (value != null) {
                          //? here will call filter api
                          // print(value);
                          featuredProductsCubit
                              .getFeaturedProductsAfterFilter(value);
                        }
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 17.h,
            ),
          ),
          BlocConsumer<FeaturedProductsCubit, FeaturedProductsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is FeaturedProductsLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CustomCircularProgressIndicator(),
                  ),
                );
              } else {
                if (featuredProductsCubit.allFeaturedProducts.isEmpty) {
                  return SliverFillRemaining(
                    child: NoResult(
                      title: S.of(context).no_result_found,
                    ),
                  );
                } else {
                  return SliverGrid.builder(
                    itemCount: featuredProductsCubit.allFeaturedProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 50.w,
                        // mainAxisSpacing: 150.h,
                        crossAxisCount: 2,
                        mainAxisExtent: 355.h),
                    itemBuilder: (context, index) {
                      Product productItem =
                          featuredProductsCubit.allFeaturedProducts[index];
                      return ProductsItem(
                        imageUrl: productItem.image ?? "",
                        brandName: productItem.brandName ?? "Brand name",
                        companyName: productItem.companyName ?? "",
                        isFavorite: productItem.isFavorite ?? '0',
                        price: productItem.price ?? 0.000,
                        offerPrice: productItem.discountPrice ?? 0.000,
                        title: productItem.name ?? "No title",
                        offerPercentage:
                            productItem.calculateOfferPercentage() ?? 0,
                      );
                    },
                  );
                }
              }
            },
          )
        ],
      ),
    );
  }
}
