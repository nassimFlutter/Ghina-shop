import 'package:best_price/feature/home/presentation/view/widgets/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'products_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.h,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductsItem();
        },
      ),
    );
  }
}
