import 'package:best_price/feature/home/data/fucker/fucker_list.dart';
import 'package:best_price/feature/home/data/models/product_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: ListView.builder(
        itemCount: productList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Product productItem = productList[index];
          return ProductsItem(
            title: productItem.title ?? "",
            offerPrice: productItem.offerPrice,
            price: productItem.price ?? 0.0,
            offerPercentage: productItem.calculateOfferPercentage() ?? 0.0,
            imageUrl: productItem.mainImage ?? "",
            brandName: productItem.brandName ?? "",
            companyName: productItem.companyName ?? "",
          );
        },
      ),
    );
  }
}
