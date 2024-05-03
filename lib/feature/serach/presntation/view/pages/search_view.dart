import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/flitter_bottom.dart';
import 'package:best_price/core/widgets/not_found_widget.dart';
import 'package:best_price/core/widgets/product_grid_view.dart';
import 'package:best_price/core/widgets/search_field.dart';
import 'package:best_price/feature/serach/presntation/manager/cubit/search_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    SearchCubit searchCubit = SearchCubit.get(context);
    return WillPopScope(
      onWillPop: () async {
        await searchCubit.initSearch();
        return true;
      },
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: Dimensions.dStartPadding.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: Dimensions.dTopPadding.h,
              ),
            ),
            SliverToBoxAdapter(
                child: AppBarRow(
              iconPath: IconsPath.arrowLeftIcon,
              title: S.of(context).search, //"Search",
              onFirstIconTap: () async {
                await searchCubit.initSearch();
                if (context.mounted) {
                  HelperFunctions.navigateToBack(context);
                }
              },
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 19.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: SearchField(
                    controller: searchCubit.searchController,
                    onFieldSubmitted: (searchQuery) async {
                      await searchCubit.searchByName(searchQuery);
                    },
                  )),
                  SizedBox(
                    width: 6.w,
                  ),
                  const FlitterBottom(),
                ],
              ),
            ),
            BlocConsumer<SearchCubit, SearchState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CustomCircularProgressIndicator(),
                    ),
                  );
                } else if (state is SearchSuccess) {
                  if (searchCubit.productSearchResult.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: NoResult(title: "no ")),
                    );
                  } else {
                    return ProductGridView(
                        productList: searchCubit.productSearchResult);
                  }
                } else {
                  return const SliverToBoxAdapter(
                    child: SizedBox(),
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
