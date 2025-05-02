import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/not_found_widget.dart';
import 'package:best_price/feature/flitter_sort/presentaion/view/pages/flitter_sort_view.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:best_price/feature/new_arrivals/presentations/manager/cubit/new_arrivals_cubit.dart';
import 'package:best_price/feature/product_details/presentation/view/product_details_page.dart';
import 'package:best_price/feature/wish/presentation/manager/add_and_remove_from_favorite_cubit/add_and_remove_from_favorite_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewArriversViewBody extends StatelessWidget {
  const NewArriversViewBody({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    NewArrivalsCubit newArrivalsCubit = NewArrivalsCubit.get(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: Dimensions.dStartPadding,
        end: Dimensions.dStartPadding,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: Dimensions.dTopPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppBarRow(
                      iconPath: IconsPath.arrowLeftIcon,
                      title: S.of(context).new_arrivals, //"New Arrivals",
                    ),
                  ),
                  // AppBarBottom(
                  //   iconPath: IconsPath.flitterIcon,
                  //   onTap: () {
                  //     // HelperFunctions.navigateToScreen(
                  //     //   context,
                  //     //   const FlitterSortView(
                  //     //     endValue: 100,
                  //     //   ),
                  //     // );
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => FlitterSortView(
                  //           endValue:
                  //               newArrivalsCubit.maxProductPrice.toDouble(),
                  //           page: "newst",
                  //         ),
                  //       ),
                  //     ).then((value) {
                  //       if (value != null) {
                  //         //? here will call filter api
                  //         // print(value);
                  //         newArrivalsCubit.getNewArrivalsAfterFilter(value);
                  //       }
                  //     });
                  //   },
                  // )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 17.h,
            ),
          ),
          BlocConsumer<NewArrivalsCubit, NewArrivalsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is NewArrivalsLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CustomCircularProgressIndicator(),
                  ),
                );
              } else {
                if (newArrivalsCubit.allNewArrivalsProducts.isEmpty) {
                  return SliverFillRemaining(
                    child: NoResult(
                      title: S.of(context).no_result_found,
                    ),
                  );
                } else {
                  return SliverGrid.builder(
                    itemCount: newArrivalsCubit.allNewArrivalsProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 50.w,
                        crossAxisCount: 2,
                        mainAxisExtent: 355.h),
                    itemBuilder: (context, index) {
                      Product productItem =
                          newArrivalsCubit.allNewArrivalsProducts[index];
                      double price = (productItem.price ?? 0).toDouble();
                      double discountPercentage =
                          (productItem.discountPrice ?? 0).toDouble();

                      double offerPrice =
                          price - (price * discountPercentage / 100);
                      return BlocConsumer<AddAndRemoveFromFavoriteCubit,
                          AddAndRemoveFromFavoriteState>(
                        listener: (context, state) {
                          if (state is AddAndRemoveFromFavoriteSuccess) {
                            if (state.productId == productItem.id) {
                              if (state.successMessage == "removed") {
                                productItem.isFavorite = false;
                              } else {
                                productItem.isFavorite = true;
                              }
                            }
                          }
                        },
                        builder: (context, state) {
                          return ProductsItem(
                            imageUrl: productItem.images?.first ?? "",
                            brandName: "Brand name",
                            companyName: "",
                            price: productItem.price ?? 0.000,
                            offerPrice: offerPrice,
                            title: productItem.name ?? "No title",
                            isFavorite: productItem.isFavorite ?? false,
                            offerPercentage: 0,
                            onFavoriteTap: () {
                              BlocProvider.of<AddAndRemoveFromFavoriteCubit>(
                                      context)
                                  .addAndRemoveFromFavorite(context,
                                      productId: productItem.id ?? -1);
                            },
                            onTap: () {
                              HelperFunctions.navigateToScreen(
                                context,
                                ProductDetailsPage(
                                  id: productItem.id ?? 0,
                                ),
                              );
                            },
                          );
                        },
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
