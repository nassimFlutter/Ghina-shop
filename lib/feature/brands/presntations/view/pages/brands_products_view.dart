import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/product_grid_view.dart';
import 'package:best_price/feature/brands/presntations/manager/product_brands_cubit/product_brands_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandProductsView extends StatefulWidget {
  const BrandProductsView({super.key, required this.brandsId});
  final int brandsId;
  @override
  State<BrandProductsView> createState() => _BrandProductsViewState();
}

class _BrandProductsViewState extends State<BrandProductsView> {
  @override
  void initState() {
    BlocProvider.of<ProductBrandsCubit>(context)
        .fetchProductByBrandsId(widget.brandsId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
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
              child: const AppBarRow(
                  iconPath: IconsPath.arrowLeftIcon, title: "title"),
            )),
            const ProductGridView(
              productList: [],
            )
          ],
        ),
      )),
    );
  }
}
