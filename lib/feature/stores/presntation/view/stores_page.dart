import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/category/presentaion/view/widgets/shimmer_category_card.dart';
import 'package:best_price/feature/stores/data/models/store_response.dart';
import 'package:best_price/feature/stores/presntation/managers/get_all_products_for_store_cubit/get_all_stores_cubit.dart';
import 'package:best_price/feature/stores/presntation/view/products_store_page.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'store_card.dart';

class StoresPageView extends StatefulWidget {
  const StoresPageView({Key? key}) : super(key: key);

  @override
  State<StoresPageView> createState() => _StoresPageViewState();
}

class _StoresPageViewState extends State<StoresPageView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllStoresCubit>(context).getAllStores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsetsDirectional.only(
              top: Dimensions.dTopPadding, start: Dimensions.dStartPadding),
          sliver: SliverToBoxAdapter(
            child: Text(
              S.of(context).stores, // 'stores',
              style: AppStyles.textStyle20w700,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 40.h,
          ),
        ),
        BlocBuilder<GetAllStoresCubit, GetAllStoresState>(
          builder: (context, state) {
            if (state is GetAllStoresLoading) {
              return SliverGrid.builder(
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return const ShimmerCategoryCard();
                  });
            } else if (state is GetAllStoresSuccess) {
              return SliverPadding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                sliver: SliverGrid.builder(
                  itemCount: state.stores.data?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 15.h,
                      crossAxisCount: 2,
                      childAspectRatio: 1.1),
                  itemBuilder: (BuildContext context, int index) {
                    Data? store = state.stores.data?[index];
                    return GestureDetector(
                      onTap: () {
                        HelperFunctions.navigateToScreen(context,
                            ProductsStorePage(storeId: store?.id ?? 0));
                      },
                      child: StoreCard(
                        storeName: store?.name ?? "",
                        imageUrl: store?.image ??
                            "https://demo1.weisro.com/newLogo.png",
                      ),
                    );
                  },
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
            }
          },
        )
      ],
    ));
  }
}
