import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/flitter_bottom.dart';
import '../../../../../core/widgets/product_grid_view.dart';

class NewArriversViewBody extends StatelessWidget {
  const NewArriversViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: Dimensions.dStartPadding,
        end: Dimensions.dStartPadding,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: Dimensions.dTopPadding),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarRow(
                      iconPath: IconsPath.arrowLeftIcon, title: "New Arrivals"),
                  FlitterBottom()
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 23.h,
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
