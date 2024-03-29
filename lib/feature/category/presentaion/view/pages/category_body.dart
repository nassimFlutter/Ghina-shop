import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/category/data/fucker_data.dart';
import 'package:best_price/feature/category/presentaion/view/pages/product_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/category_card.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsetsDirectional.only(
              top: Dimensions.dTopPadding, start: Dimensions.dStartPadding),
          sliver: SliverToBoxAdapter(
            child: Text('Categories', style: AppStyles.textStyle20w700),
          ),
        ),
        SliverPadding(
          padding: EdgeInsetsDirectional.only(
              end: Dimensions.dStartPadding,
              start: Dimensions.dStartPadding,
              bottom: 10.h,
              top: 35.h),
          sliver: SliverGrid.builder(
              itemCount: FuckerDataCategory.category.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return CategoryCard(
                  imageUrl: FuckerDataCategory.category[index].imageUrl,
                  title: FuckerDataCategory.category[index].title,
                  onTap: () {
                    HelperFunctions.navigateToScreen(
                        context,
                        ProductCategoryView(
                          title: FuckerDataCategory.category[index].title,
                        ));
                  },
                );
              }),
        ),
      ],
    );
  }
}
