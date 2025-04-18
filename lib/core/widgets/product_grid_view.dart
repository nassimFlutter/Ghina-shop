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
        // mainAxisSpacing: 150.h,
        // childAspectRatio: 160.w / 300.h,
        crossAxisCount: 2,
        mainAxisExtent: 320.w,
      ),
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
          imageUrl: productItem.image ?? "",
          brandName: productItem.brandName ?? "No brand Name",
          isFavorite: productItem.isFavorite ?? "0",
          companyName: productItem.companyName ?? "company Name",
          price: productItem.price ?? 0.000,
          offerPrice: productItem.discountPrice ?? 0.000,
          title: productItem.name ?? "No title",
          offerPercentage: productItem.calculateOfferPercentage() ?? 0,
        );
      },
    );
  }
}
