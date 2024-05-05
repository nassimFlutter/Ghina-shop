import 'package:best_price/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
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
      height: 360.h,
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
          return ProductsItem(
            onTap: () {
              HelperFunctions.navigateToScreen(
                  context,
                  ProductDetailsPage(
                    id: productItem.id ?? 0,
                  ));
            },
            title: productItem.name ?? "",
            isFavorite: productItem.isFavorite ?? "0",
            offerPrice: productItem.discountPrice,
            price: productItem.price ?? 0.0,
            offerPercentage: productItem.calculateOfferPercentage() ?? 0.0,
            imageUrl: productItem.image ?? "",
            brandName: productItem.brandName ?? "no name",
            companyName: productItem.companyName ?? "",
          );
        },
      ),
    );
  }
}
