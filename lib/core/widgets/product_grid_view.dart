import 'package:best_price/feature/home/data/fucker/fucker_list.dart';
import 'package:best_price/feature/home/data/models/product_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: FuckerData.featuredProductsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 50.w,
          // mainAxisSpacing: 150.h,
          crossAxisCount: 2,
          mainAxisExtent: 355.h),
      itemBuilder: (context, index) {
        Product productItem = FuckerData.featuredProductsList[index];
        return ProductsItem(
          imageUrl: productItem.mainImage ?? "",
          brandName: productItem.brandName ?? " ",
          companyName: productItem.companyName ?? "",
          price: productItem.price ?? 0.000,
          offerPrice: productItem.offerPrice ?? 0.000,
          title: productItem.title ?? "",
          offerPercentage: productItem.calculateOfferPercentage() ?? 0,
        );
      },
    );
  }
}
