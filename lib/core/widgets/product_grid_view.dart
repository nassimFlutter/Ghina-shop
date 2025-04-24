import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:best_price/feature/product_details/presentation/view/product_details_page.dart';
import 'package:flutter/material.dart';
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
        return ProductsItem(
          onTap: () {
            HelperFunctions.navigateToScreen(
                context,
                ProductDetailsPage(
                  id: productItem.id ?? 0,
                ));
          },
          // onFavoriteTap: ,
          imageUrl: productItem.images?.first ?? "",
          brandName: "No brand Name",
          isFavorite: productItem.isFavorite ?? false,
          companyName: "company Name",
          price: productItem.price ?? 0.000,
          offerPrice: productItem.discountPrice ?? 0.000,
          title: productItem.name ?? "No title",
          offerPercentage: 0.0,
        );
      },
    );
  }
}
