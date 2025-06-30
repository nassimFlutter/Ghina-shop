import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:best_price/feature/product_details/presentation/view/product_details_page.dart';
import 'package:best_price/feature/wish/presentation/manager/add_and_remove_from_favorite_cubit/add_and_remove_from_favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaginatedProductGridView extends StatefulWidget {
  const PaginatedProductGridView({
    super.key,
    required this.productList,
    required this.onLoadMore,
    required this.hasMoreData,
    required this.isLoadingMore,
  });

  final List<Product> productList;
  final VoidCallback onLoadMore;
  final bool hasMoreData;
  final bool isLoadingMore;

  @override
  State<PaginatedProductGridView> createState() =>
      _PaginatedProductGridViewState();
}

class _PaginatedProductGridViewState extends State<PaginatedProductGridView> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.productList.length + (widget.hasMoreData ? 1 : 0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 50.w,
        mainAxisSpacing: 0.h,
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        // Show loading indicator at the end if there's more data
        if (index == widget.productList.length) {
          return widget.isLoadingMore
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox.shrink();
        }

        Product productItem = widget.productList[index];
        double price = (productItem.price ?? 0).toDouble();
        double discountPercentage = (productItem.discountPrice ?? 0).toDouble();
        double offerPrice = price - (price * discountPercentage / 100);

        return BlocConsumer<AddAndRemoveFromFavoriteCubit,
            AddAndRemoveFromFavoriteState>(
          listener:
              (BuildContext context, AddAndRemoveFromFavoriteState state) {
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
              onTap: () {
                HelperFunctions.navigateToScreen(
                  context,
                  ProductDetailsPage(
                    id: productItem.id ?? 0,
                  ),
                );
              },
              imageUrl: productItem.image ?? "",
              brandName: "No brand Name",
              isFavorite: productItem.isFavorite ?? false,
              companyName: "company Name",
              price: price,
              offerPrice: offerPrice,
              title: productItem.name ?? "No title",
              offerPercentage: discountPercentage,
              onFavoriteTap: () {
                BlocProvider.of<AddAndRemoveFromFavoriteCubit>(context)
                    .addAndRemoveFromFavorite(context,
                        productId: productItem.id ?? -1);
              },
            );
          },
        );
      },
    );
  }
}
