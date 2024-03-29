import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/feature/flitter_sort/presentaion/view/flitter_sort_view.dart';
import 'package:best_price/feature/home/data/fucker/fucker_list.dart';
import 'package:best_price/feature/home/data/models/product_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widgets/search_field.dart';

class ProductCategoryView extends StatelessWidget {
  const ProductCategoryView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductCategoryViewBody(title: title),
    );
  }
}

class ProductCategoryViewBody extends StatelessWidget {
  const ProductCategoryViewBody({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: Dimensions.dStartPadding.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsetsDirectional.only(top: Dimensions.dTopPadding.h),
            child: AppBarRow(iconPath: IconsPath.arrowLeftIcon, title: title),
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 21.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                const SearchField(),
                SizedBox(
                  width: 6.w,
                ),
                const FlitterBottom()
              ],
            ),
          ),
          SliverGrid.builder(
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
          )
        ],
      ),
    );
  }
}

class FlitterBottom extends StatelessWidget {
  const FlitterBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HelperFunctions.navigateToScreen(
            context, const FlitterSortView());
      },
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(9),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFE6E6E6)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(IconsPath.flitterIcon),
        ),
      ),
    );
  }
}
