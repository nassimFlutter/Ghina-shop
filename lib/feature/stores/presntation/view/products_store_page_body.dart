import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/not_found_widget.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:best_price/feature/product_details/presentation/view/product_details_page.dart';
import 'package:best_price/feature/stores/presntation/managers/get_all_products_for_store_cubit/get_all_products_for_store_cubit.dart';
import 'package:best_price/feature/wish/presentation/manager/add_and_remove_from_favorite_cubit/add_and_remove_from_favorite_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsStorePageBody extends StatefulWidget {
  const ProductsStorePageBody({super.key, required this.storeId});
  final int storeId;
  @override
  State<ProductsStorePageBody> createState() => _ProductsStorePageBodyState();
}

class _ProductsStorePageBodyState extends State<ProductsStorePageBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllProductsForStoreCubit>(context)
        .getAllProductForStore(widget.storeId);
  }

  @override
  Widget build(BuildContext context) {
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
                      title: S.of(context).products, // "Featured Products",
                      onFirstIconTap: () {
                        HelperFunctions.navigateToBack(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 17.h,
            ),
          ),
          BlocConsumer<GetAllProductsForStoreCubit,
              GetAllProductsForStoreState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is GetAllProductsForStoreLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CustomCircularProgressIndicator(),
                  ),
                );
              } else if (state is GetAllProductsForStoreSuccess) {
                if (state.products.isEmpty) {
                  return SliverFillRemaining(
                    child: NoResult(
                      title: S.of(context).no_result_found,
                    ),
                  );
                } else {
                  return SliverGrid.builder(
                    itemCount: state.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 50.w,
                        // mainAxisSpacing: 150.h,
                        crossAxisCount: 2,
                        mainAxisExtent: 355.h),
                    itemBuilder: (context, index) {
                      Product productItem = state.products[index];

                      double price = (productItem.price ?? 0).toDouble();
                      double discountPercentage =
                          (productItem.discountPrice ?? 0).toDouble();

                      double offerPrice =
                          price - (price * discountPercentage / 100);

                      return BlocBuilder<AddAndRemoveFromFavoriteCubit,
                          AddAndRemoveFromFavoriteState>(
                        builder: (context, state) {
                          return ProductsItem(
                            imageUrl: productItem.image ?? "",
                            brandName: "Brand name",
                            companyName: "",
                            isFavorite: productItem.isFavorite ?? false,
                            price: productItem.price ?? 0.000,
                            offerPrice: offerPrice,
                            title: productItem.name ?? "No title",
                            offerPercentage: 0,
                            onTap: () {
                              HelperFunctions.navigateToScreen(
                                context,
                                ProductDetailsPage(
                                  id: productItem.id ?? 0,
                                ),
                              );
                            },
                            onFavoriteTap: () {},
                          );
                        },
                      );
                    },
                  );
                }
              } else {
                return const SliverToBoxAdapter(
                  child: SizedBox.shrink(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
