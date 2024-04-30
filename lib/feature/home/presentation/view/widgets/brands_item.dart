import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/brands/presntations/view/pages/brands_products_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsItem extends StatelessWidget {
  const BrandsItem({
    super.key,
    required this.imageUrl,
    required this.brandId, required this.title,
  });
  final String imageUrl,title;
  final int brandId;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       
        HelperFunctions.navigateToScreen(
            context,
            BrandProductsView(
              brandsId: brandId,
              title: title,
              
            ));
      },
      child: Container(
        height: 61.h,
        width: 102.w,
        margin: EdgeInsetsDirectional.only(end: 10.w),
        decoration: ShapeDecoration(
          color: AppColor.greyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            12,
          ),
          child: Center(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
