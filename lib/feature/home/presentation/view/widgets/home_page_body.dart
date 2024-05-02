import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/feature/best_selling/presntations/view/pages/best_selling_view.dart';
import 'package:best_price/feature/brands/presntations/view/pages/brands_view.dart';
import 'package:best_price/feature/category/presentaion/view/pages/category_body.dart';
import 'package:best_price/feature/featured_products/presentation/view/pages/featured_products_view.dart';
import 'package:best_price/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_ad_list.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_brands_home_list.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_category_home_list.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_home_title.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_let_start_text.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_products_list.dart';
import 'package:best_price/feature/new_arrivals/presentations/view/pages/new_arrivers_view.dart';
import 'package:best_price/feature/serach/presntation/view/pages/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/widgets/error_widget.dart';
import 'ad_list.dart';
import 'brands_home_list.dart';
import 'category_home_list.dart';
import 'home_title.dart';
import 'let_start_text.dart';
import 'products_list.dart';

class HomePgeBody extends StatelessWidget {
  const HomePgeBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    // homeCubit.getHomePage();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(IconsPath.homeLogoIcon),
            GestureDetector(
              onTap: () {
                HelperFunctions.navigateToScreen(context, const SearchView());
              },
              child: SvgPicture.asset(IconsPath.searchIcon),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeCubitFailure) {
              return const CustomErrorWidget();
            } else {
              return ListView(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: Dimensions.dStartPadding.w),
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(top: 14.h),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SvgPicture.asset(IconsPath.homeLogoIcon),
                  //       GestureDetector(
                  //           onTap: () {
                  //             HelperFunctions.navigateToScreen(
                  //                 context, const SearchView());
                  //           },
                  //           child: SvgPicture.asset(IconsPath.searchIcon)),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 26.h),
                  BlocConsumer<HomeCubit, HomeCubitState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerLetStartText();
                      } else {
                        return const LetStartText();
                      }
                    },
                  ),
                  SizedBox(height: 12.h),
                  //!................ here Ad list .......
                  BlocConsumer<HomeCubit, HomeCubitState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerAdList();
                      } else {
                        return const AdList();
                      }
                    },
                  ),
                  SizedBox(height: 26.h),
                  BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerHomeTitle(
                          title: "",
                        );
                      } else {
                        return HomeTitle(
                          title: 'Categories',
                          onTap: () {
                            HelperFunctions.navigateToScreen(context,
                                const Scaffold(body: CategoryViewBody()));
                          },
                        );
                      }
                    },
                  ),
                  SizedBox(height: 26.h),
                  //! in this there ara margin ..
                  //? this category in home page ..
                  BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerCategoryHomeList();
                      } else {
                        return const CategoryHomeList();
                      }
                    },
                  ),
                  SizedBox(height: 30.h),
                  //! Featured products
                  BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerHomeTitle(title: "");
                      } else {
                        return HomeTitle(
                          title: 'Featured products',
                          onTap: () {
                            HelperFunctions.navigateToScreen(
                                context, const FeaturedProductView());
                          },
                        );
                      }
                    },
                  ),
                  SizedBox(height: 19.h),

                  //! Featured products List
                  BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerProductsList();
                      } else {
                        // HelperFunctions.navigateToScreen(
                        //                   context,
                        //                   ProductDetailsPage(
                        //                     id: productItem.id ?? 0,
                        //                   ));
                        return ProductsList(
                          productList: homeCubit
                                  .homeApiResponse.item?.featuredProducts ??
                              [],
                        );
                      }
                    },
                  ),
                  SizedBox(height: 51.h),

                  BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerHomeTitle(title: "");
                      } else {
                        return HomeTitle(
                          title: 'Best Selling',
                          onTap: () {
                            HelperFunctions.navigateToScreen(
                                context, const BestSellingView());
                          },
                        );
                      }
                    },
                  ),
                  SizedBox(height: 19.h),
                  // ! Best Selling List
                  BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerProductsList();
                      } else {
                        return ProductsList(
                          productList: homeCubit
                                  .homeApiResponse.item?.bestSellerProducts ??
                              [],
                        );
                      }
                    },
                  ),
                  SizedBox(height: 26.h),
                  //!Brands
                  BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerHomeTitle(title: "");
                      } else {
                        return HomeTitle(
                          title: 'Brands',
                          onTap: () {
                            HelperFunctions.navigateToScreen(
                                context, const BrandsView());
                          },
                        );
                      }
                    },
                  ),
                  SizedBox(height: 12.h),
                  //! brands List
                  BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerBrandsHomeList();
                      } else {
                        return const BrandsHomeList();
                      }
                    },
                  ),
                  SizedBox(height: 46.h),
                  // ! New Arrivals List
                  BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerHomeTitle(title: "");
                      } else {
                        return HomeTitle(
                          title: 'New Arrivals',
                          onTap: () {
                            HelperFunctions.navigateToScreen(
                                context, const NewArriversView());
                          },
                        );
                      }
                    },
                  ),
                  SizedBox(height: 19.h),

                  BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      if (state is HomeCubitLoading) {
                        return const ShimmerProductsList();
                      } else {
                        return ProductsList(
                          productList:
                              homeCubit.homeApiResponse.item?.newstProducts ??
                                  [],
                        );
                      }
                    },
                  ),
                  SizedBox(height: 18.h),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
