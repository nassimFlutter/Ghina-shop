import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/not_found_widget.dart';
import 'package:best_price/core/widgets/product_grid_view.dart';
import 'package:best_price/feature/brands/presntations/manager/product_brands_cubit/product_brands_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandProductsView extends StatefulWidget {
  const BrandProductsView(
      {super.key, required this.brandsId, required this.title});
  final int brandsId;
  final String title;
  @override
  State<BrandProductsView> createState() => _BrandProductsViewState();
}
// todo : finish translate
class _BrandProductsViewState extends State<BrandProductsView> {
  @override
  void initState() {
    BlocProvider.of<ProductBrandsCubit>(context)
        .fetchProductByBrandsId(widget.brandsId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductBrandsCubit productBrandsCubit = ProductBrandsCubit.get(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: Dimensions.dStartPadding.w,
          end: Dimensions.dStartPadding.w,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding:
                  EdgeInsetsDirectional.only(top: Dimensions.dTopPadding.h),
              child: AppBarRow(
                  iconPath: IconsPath.arrowLeftIcon, title: widget.title),
            )),
            BlocConsumer<ProductBrandsCubit, ProductBrandsState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is ProductBrandsLoading) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CustomCircularProgressIndicator(),
                    ),
                  );
                } else {
                  final products = productBrandsCubit
                      .productBrandsResponse.items?.first.products;
                  if (products != null && products.isNotEmpty) {
                    return ProductGridView(
                      productList: products,
                    );
                  } else {
                    return SliverFillRemaining(
                      child: Center(
                        child: NoResult(
                          title: S
                              .of(context)
                              .no_products_available, // "No products available",
                        ),
                      ),
                    );
                  }
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
