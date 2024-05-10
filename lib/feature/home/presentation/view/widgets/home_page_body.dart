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
import 'package:best_price/feature/home/presentation/manager/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_ad_list.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_brands_home_list.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_category_home_list.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_home_title.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_let_start_text.dart';
import 'package:best_price/feature/home/presentation/view/widgets/shimmer_products_list.dart';
import 'package:best_price/feature/new_arrivals/presentations/view/pages/new_arrivers_view.dart';
import 'package:best_price/feature/serach/presntation/view/pages/search_view.dart';
import 'package:best_price/generated/l10n.dart';
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
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    NavBarCubit navBarCubit = NavBarCubit.get(context);
    // homeCubit.getHomePage();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            HelperFunctions.navigateToScreen(context, const SearchView());
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w, bottom: 9.h),
            child: SvgPicture.asset(
              IconsPath.searchIcon,
              width: 24.w,
              fit: BoxFit.cover,
              height: 24.h,
            ),
          ),
        ),
        // centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w, bottom: 9.h),
            child: SvgPicture.asset(IconsPath.homeLogoIcon),
          )
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeCubitFailure) {
              return const CustomErrorWidget();
            } else {
              return Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsetsDirectional.only(
                  //     start: 16,
                  //     end: 16,
                  //     top: 16,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SvgPicture.asset(IconsPath.homeLogoIcon),
                  //       GestureDetector(
                  //         onTap: () {
                  //           HelperFunctions.navigateToScreen(
                  //               context, const SearchView());
                  //         },
                  //         child: SvgPicture.asset(IconsPath.searchIcon),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    child: ListView(
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
                                title: S.of(context).categories, //'Categories',
                                onTap: () {
                                  navBarCubit.changeTab(1);
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: 24.h),
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
                                title: S
                                    .of(context)
                                    .featured_products, //'Featured products',
                                onTap: () {
                                  HelperFunctions.navigateToScreen(
                                      context, const FeaturedProductView());
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: 16.h),
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
                                productList: homeCubit.featuredProductsList,
                              );
                            }
                          },
                        ),
                        SizedBox(height: 10.h),

                        BlocBuilder<HomeCubit, HomeCubitState>(
                          builder: (context, state) {
                            if (state is HomeCubitLoading) {
                              return const ShimmerHomeTitle(title: "");
                            } else {
                              return HomeTitle(
                                title: S
                                    .of(context)
                                    .best_selling, //'Best Selling',
                                onTap: () {
                                  HelperFunctions.navigateToScreen(
                                      context, const BestSellingView());
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: 16.h),
                        // ! Best Selling List
                        BlocBuilder<HomeCubit, HomeCubitState>(
                          builder: (context, state) {
                            if (state is HomeCubitLoading) {
                              return const ShimmerProductsList();
                            } else {
                              return ProductsList(
                                productList: homeCubit.bestSellerProductsList,
                              );
                            }
                          },
                        ),
                        SizedBox(height: 10.h),
                        //!Brands
                        BlocBuilder<HomeCubit, HomeCubitState>(
                          builder: (context, state) {
                            if (state is HomeCubitLoading) {
                              return const ShimmerHomeTitle(title: "");
                            } else {
                              return HomeTitle(
                                title: S.of(context).brands, //'Brands',
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
                                title: S
                                    .of(context)
                                    .new_arrivals, //'New Arrivals',
                                onTap: () {
                                  HelperFunctions.navigateToScreen(
                                      context, const NewArriversView());
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: 16.h),

                        BlocBuilder<HomeCubit, HomeCubitState>(
                          builder: (context, state) {
                            if (state is HomeCubitLoading) {
                              return const ShimmerProductsList();
                            } else {
                              return ProductsList(
                                productList: homeCubit.newstProductsList,
                              );
                            }
                          },
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
