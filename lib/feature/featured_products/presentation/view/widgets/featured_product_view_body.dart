import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/feature/account/data/fuck_data.dart';
import 'package:best_price/feature/flitter_sort/presentaion/view/flitter_sort_view.dart';
import 'package:best_price/feature/home/data/fucker/fucker_list.dart';
import 'package:best_price/feature/home/data/models/product_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedProductViewBody extends StatelessWidget {
  const FeaturedProductViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                top: Dimensions.dTopPadding.h,
                end: Dimensions.dStartPadding,
                start: Dimensions.dStartPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppBarRow(
                    iconPath: IconsPath.arrowLeftIcon,
                    title: "Featured Products"),
                AppBarBottom(
                  iconPath: IconsPath.flitterIcon,
                  onTap: () {
                    HelperFunctions.navigateToScreen(
                        context, const FlitterSortView());
                  },
                )
              ],
            ),
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
    );
  }
}
