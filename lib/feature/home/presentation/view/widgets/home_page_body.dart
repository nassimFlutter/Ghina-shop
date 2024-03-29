import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/featured_products/presentation/view/pages/featured_products_view.dart';
import 'package:best_price/feature/featured_products/presentation/view/widgets/featured_product_view_body.dart';
import 'package:best_price/feature/home/data/fucker/fucker_list.dart';
import 'package:best_price/feature/new_arrivals/presentations/view/pages/new_arrivers_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ad_list.dart';
import 'category_home_list.dart';
import 'home_title.dart';
import 'products_list.dart';

class HomePgeBody extends StatelessWidget {
  const HomePgeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: Dimensions.dStartPadding.w),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(IconsPath.homeLogoIcon),
                SvgPicture.asset(IconsPath.searchIcon),
              ],
            ),
          ),
          SizedBox(height: 26.h),
          Text(
            "Let’s start shopping!",
            style: AppStyles.textStyle17w700.copyWith(color: Colors.black),
          ),
          SizedBox(height: 12.h),
          //!................ here Ad list .......
          const AdList(),
          SizedBox(height: 26.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.dStartPadding.w),
            child: const HomeTitle(title: 'Categories'),
          ),
          SizedBox(height: 26.h),
          //! in this there ara margin ..
          const CategoryHomeList(),
          SizedBox(height: 30.h),

          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.dStartPadding.w),
            child: HomeTitle(
              title: 'Featured products',
              onTap: () {
                HelperFunctions.navigateToScreen(
                    context, const FeaturedProductView());
              },
            ),
          ),
          //! Featured products List
          ProductsList(
            productList: FuckerData.featuredProductsList,
          ),
          SizedBox(height: 51.h),

          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.dStartPadding.w),
            child: const HomeTitle(title: 'Best Selling'),
          ),
          // ! Best Selling List
          ProductsList(
            productList: FuckerData.bestSellingList,
          ),
          SizedBox(height: 26.h),

          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.dStartPadding.w),
            child: const HomeTitle(title: 'Brands'),
          ),
          SizedBox(height: 12.h),

          const BrandsHomeList(),
          SizedBox(height: 46.h),
          // ! New Arrivals List
          Padding(
            padding:
                EdgeInsetsDirectional.only(end: Dimensions.dStartPadding.w),
            child: HomeTitle(
              title: 'New Arrivals',
              onTap: () {
                HelperFunctions.navigateToScreen(
                    context, const NewArriversView());
              },
            ),
          ),
          ProductsList(
            productList: FuckerData.newArrivalsList,
          ),
          SizedBox(height: 18.h),
        ],
      ),
    );
  }
}

class BrandsHomeList extends StatelessWidget {
  const BrandsHomeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const BrandsItem();
        },
      ),
    );
  }
}

class BrandsItem extends StatelessWidget {
  const BrandsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.h,
      width: 102.w,
      margin: EdgeInsetsDirectional.only(end: 10.w),
      decoration: ShapeDecoration(
        color: AppColor.greyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Center(child: SvgPicture.asset(IconsPath.appleIcon)),
    );
  }
}
