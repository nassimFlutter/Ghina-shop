import 'package:best_price/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:best_price/feature/wish/presentation/manager/add_and_remove_from_favorite_cubit/add_and_remove_from_favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/helper_functions.dart';
import '../../../../product_details/presentation/view/product_details_page.dart';
import '../../../data/models/home_model.dart';
import 'products_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    required this.productList,
  });
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280 .h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: productList.length,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 12.w,
          );
        },
        itemBuilder: (context, index) {
          Product productItem = productList[index];
          debugPrint(
              'productItem: ${productItem.name} ${productItem.isFavorite}');
          double price = (productItem.price ?? 0).toDouble();
          double discountPercentage =
              (productItem.discountPrice ?? 0).toDouble();

          double offerPrice = price - (price * discountPercentage / 100);
          return ProductsItem(
            onTap: () {
              HelperFunctions.navigateToScreen(
                  context,
                  ProductDetailsPage(
                    id: productItem.id ?? 0,
                  ));
            },
            onFavoriteTap: () {
              if (HelperFunctions.isGuest()) {
                HelperFunctions.navigateToScreen(context, const LoginView());
              } else {
                if (BlocProvider.of<AddAndRemoveFromFavoriteCubit>(context)
                    .state is AddAndRemoveFromFavoriteLoading) {
                } else {
                  BlocProvider.of<AddAndRemoveFromFavoriteCubit>(context)
                      .addAndRemoveFromFavorite(context,
                          productId: productItem.id ?? -1);
                }
              }
            },
            title: productItem.name ?? "",
            isFavorite: productItem.isFavorite ?? false,
            offerPrice: offerPrice,
            price: productItem.price ?? 0.0,
            offerPercentage: 0.0,
            imageUrl: productItem.image ?? "",
            brandName: "no name",
            companyName: "",
          );
        },
      ),
    );
  }
}
