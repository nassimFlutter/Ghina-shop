import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/flitter_sort/presentaion/view/flitter_sort_view.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/home/presentation/view/widgets/products_item.dart';
import 'package:best_price/feature/wish/presentation/manager/cubit/my_wish_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWishView extends StatelessWidget {
  const MyWishView({super.key});

  @override
  Widget build(BuildContext context) {
    MyWishCubit myWishCubit = MyWishCubit.get(context);
    return Scaffold(
      body: CustomScrollView(slivers: [
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
                    iconPath: IconsPath.arrowLeftIcon, title: "Wish list"),
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
        SliverToBoxAdapter(
          child: SizedBox(
            height: 17.h,
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
            } else {
              return SliverGrid.builder(
                itemCount: myWishCubit.myWishModel.items?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 50.w,
                    // mainAxisSpacing: 150.h,
                    crossAxisCount: 2,
                    mainAxisExtent: 355.h),
                itemBuilder: (context, index) {
                  Product productItem =
                      myWishCubit.myWishModel.items?[index] ?? Product();
                  return ProductsItem(
                    imageUrl: productItem.image ?? "",
                    brandName: productItem.brandName ?? "Brand name",
                    isFavorite: productItem.isFavorite ?? '0',
                    companyName: productItem.companyName ?? "",
                    price: productItem.price ?? 0.000,
                    offerPrice: productItem.discountPrice ?? 0.000,
                    title: productItem.name ?? "No title",
                    offerPercentage:
                        productItem.calculateOfferPercentage() ?? 0,
                  );
                },
              );
            }
          },
        )
      ]),
    );
  }
}
