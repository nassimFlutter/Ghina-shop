import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:best_price/feature/product_details/presentation/view/product_details_page.dart';
import 'package:best_price/feature/wish/presentation/manager/add_and_remove_from_favorite_cubit/add_and_remove_from_favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.productList,
  });
  final List<Product> productList;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 50.w,
          mainAxisSpacing: 0.h,
          crossAxisCount: 2,
          childAspectRatio: 0.6),
      itemBuilder: (context, index) {
        Product productItem = productList[index];

        double price = (productItem.price ?? 0).toDouble();
        double discountPercentage = (productItem.discountPrice ?? 0).toDouble();

        double offerPrice = price - (price * discountPercentage / 100);

        return BlocConsumer<AddAndRemoveFromFavoriteCubit,
            AddAndRemoveFromFavoriteState>(
          listener: (context, state) {
            // TODO: implement listener

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
