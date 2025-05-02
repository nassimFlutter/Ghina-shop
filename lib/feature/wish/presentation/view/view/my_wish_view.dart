import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/custom_no_internet_page.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:best_price/feature/product_details/presentation/view/product_details_page.dart';
import 'package:best_price/feature/wish/presentation/manager/add_and_remove_from_favorite_cubit/add_and_remove_from_favorite_cubit.dart';
import 'package:best_price/feature/wish/presentation/manager/my_wish_cubit/my_wish_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWishView extends StatelessWidget {
  const MyWishView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyWishCubit()..getMyWish(),
      child: WillPopScope(
        onWillPop: () async {
          HelperFunctions.navigateToBack(context);
          return false;
        },
        child: const Scaffold(
          body: MyWishViewBody(),
        ),
      ),
    );
  }
}

class MyWishViewBody extends StatelessWidget {
  const MyWishViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyWishCubit myWishCubit = MyWishCubit.get(context);

    return RefreshIndicator(
      color: AppColor.buddhaGold,
      onRefresh: () async {
        myWishCubit.getMyWish();
      },
      child: BlocListener<AddAndRemoveFromFavoriteCubit,
          AddAndRemoveFromFavoriteState>(
        listener: (context, state) {
          if (state is AddAndRemoveFromFavoriteSuccess) {
            myWishCubit.getMyWish();
          }
        },
        child: CustomScrollView(
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
                    Expanded(
                      child: AppBarRow(
                        iconPath: IconsPath.arrowLeftIcon,
                        title: "Wish list",
                        onFirstIconTap: () {
                          HelperFunctions.navigateToBack(context);
                        },
                      ),
                    ),
                    // AppBarBottom(
                    //   iconPath: IconsPath.flitterIcon,
                    //   onTap: () {
                    //     HelperFunctions.navigateToScreen(
                    //       context,
                    //       const FlitterSortView(
                    //         endValue: 100,
                    //       ),
                    //     );
                    //   },
                    // )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 25.h,
              ),
            ),
            BlocConsumer<MyWishCubit, MyWishState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is MyWishLoading) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CustomCircularProgressIndicator(),
                    ),
                  );
                } else if (state is MyWishFailures) {
                  return SliverFillRemaining(
                    child: CustomNoInternetPage(
                      onTap: () {
                        myWishCubit.getMyWish();
                      },
                    ),
                  );
                } else {
                  return SliverPadding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 10),
                    sliver: SliverGrid.builder(
                      itemCount: myWishCubit.myWishModel.items?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 50.w,
                          // mainAxisSpacing: 150.h,
                          crossAxisCount: 2,
                          mainAxisExtent: 355.h),
                      itemBuilder: (context, index) {
                        Product productItem =
                            myWishCubit.myWishModel.items?[index] ?? Product();
                        double price = (productItem.price ?? 0).toDouble();
                        double discountPercentage =
                            (productItem.discountPrice ?? 0).toDouble();

                        double offerPrice =
                            price - (price * discountPercentage / 100);
                        return GestureDetector(
                          onTap: () {
                            HelperFunctions.navigateToScreen(
                              context,
                              ProductDetailsPage(
                                id: productItem.id ?? 0,
                              ),
                            );
                          },
                          child: ProductsItem(
                            onTap: () {
                              HelperFunctions.navigateToScreen(
                                context,
                                ProductDetailsPage(
                                  id: productItem.id ?? 0,
                                ),
                              );
                            },
                            onFavoriteTap: () {
                              BlocProvider.of<AddAndRemoveFromFavoriteCubit>(
                                      context)
                                  .addAndRemoveFromFavorite(context,
                                      productId: productItem.id ?? -1);
                            },
                            imageUrl: productItem.image ?? "",
                            brandName: "Brand name",
                            isFavorite: true,
                            companyName: "",
                            price: productItem.price ?? 0.000,
                            offerPrice: offerPrice,
                            title: productItem.name ?? "No title",
                            offerPercentage: 0,
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
