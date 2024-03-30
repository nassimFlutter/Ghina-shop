import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/flitter_bottom.dart';
import 'package:best_price/core/widgets/product_grid_view.dart';
import 'package:best_price/core/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCategoryViewBody extends StatelessWidget {
  const ProductCategoryViewBody({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: Dimensions.dStartPadding.w,
        end: Dimensions.dStartPadding.w,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsetsDirectional.only(top: Dimensions.dTopPadding.h),
            child: AppBarRow(iconPath: IconsPath.arrowLeftIcon, title: title),
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 21.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                const Expanded(child: SearchField()),
                SizedBox(
                  width: 6.w,
                ),
                const FlitterBottom()
              ],
            ),
          ),
          const ProductGridView()
        ],
      ),
    );
  }
}
