import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/flitter_bottom.dart';
import 'package:best_price/core/widgets/product_grid_view.dart';
import 'package:best_price/core/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchViewBody(),
    );
  }
}

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: Dimensions.dStartPadding.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: Dimensions.dTopPadding.h,
            ),
          ),
          const SliverToBoxAdapter(
              child: AppBarRow(
                  iconPath: IconsPath.arrowLeftIcon, title: "Search")),
          SliverToBoxAdapter(
            child: SizedBox(
              height: Dimensions.dTopPadding.h,
            ),
          ),
          const SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [SearchField(), FlitterBottom()],
            ),
          ),
          ProductGridView(
            productList: [],
          )
        ],
      ),
    );
  }
}
