import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/not_found_widget.dart';
import 'package:best_price/feature/best_selling/presntations/manager/best_selling_cubit/best_selling_cubit.dart';
import 'package:best_price/feature/flitter_sort/presentaion/view/pages/flitter_sort_view.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({super.key});

  @override
  Widget build(BuildContext context) {
    BestSellingCubit bestSellingCubit = BestSellingCubit.get(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                top: Dimensions.dTopPadding.h,
                end: Dimensions.dStartPadding,
                start: Dimensions.dStartPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppBarRow(
                    iconPath: IconsPath.arrowLeftIcon,
                    title: S.of(context).best_selling, //"Best Selling",
                  ),
                ),
                AppBarBottom(
                  iconPath: IconsPath.flitterIcon,
                  onTap: () {
                    // HelperFunctions.navigateToScreen(
                    //     context,
                    //     FlitterSortView(
                    //       endValue: 100,
                    //     ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlitterSortView(
                          endValue: bestSellingCubit.maxProductPrice.toDouble(),
                          page: "bestseller",
                        ),
                      ),
                    ).then((value) {
                      if (value != null) {
                        //? here will call filter api
                        // print(value);
                        bestSellingCubit.getBestSellingAfterFilter(value);
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
        BlocConsumer<BestSellingCubit, BestSellingState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is BestSellingLoading) {
              return const SliverFillRemaining(
                child: Center(
                  child: CustomCircularProgressIndicator(),
                ),
              );
            } else {
              if (bestSellingCubit.allBestSellingProducts.isEmpty) {
                return SliverFillRemaining(
                  child: NoResult(
                    title: S.of(context).no_result_found,
                  ),
                );
              } else {
                return SliverGrid.builder(
                  itemCount: bestSellingCubit.allBestSellingProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 50.w,
                      // mainAxisSpacing: 150.h,
                      crossAxisCount: 2,
                      mainAxisExtent: 355.h),
                  itemBuilder: (context, index) {
                    Product productItem =
                        bestSellingCubit.allBestSellingProducts[index];
                    return ProductsItem(
                      imageUrl: productItem.images?.first ?? "",
                      brandName: "Brand name",
                      isFavorite: productItem.isFavorite ?? false,
                      companyName: "",
                      price: productItem.price ?? 0.000,
                      offerPrice: productItem.discountPrice ?? 0.000,
                      title: productItem.name ?? "No title",
                      offerPercentage: 0,
                    );
                  },
                );
              }
            }
          },
        )
      ],
    );
  }
}
