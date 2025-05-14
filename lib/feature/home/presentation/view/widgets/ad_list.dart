import 'dart:async';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/category/presentaion/view/pages/product_category_view.dart';
import 'package:best_price/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:best_price/feature/home/presentation/view/widgets/ad_item.dart';
import 'package:best_price/feature/product_details/presentation/view/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdList extends StatefulWidget {
  const AdList({super.key});

  @override
  State<AdList> createState() => _AdListState();
}

class _AdListState extends State<AdList> {
  late final PageController _pageController;
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.93);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      final homeCubit = HomeCubit.get(context);
      if (homeCubit.bannersList.isEmpty) return;

      _currentPage++;
      if (_currentPage >= homeCubit.bannersList.length) {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = HomeCubit.get(context);
    return SizedBox(
      height: 180.h,
      child: PageView.builder(
        controller: _pageController,
        itemCount: homeCubit.bannersList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              final banner = homeCubit.bannersList[index];
              if (banner.type != null) {
                if (banner.type == 1) {
                  if (banner.itemId != null) {
                    HelperFunctions.navigateToScreen(
                      context,
                      ProductDetailsPage(id: banner.itemId!),
                    );
                  }
                } else if (banner.type == 2) {
                  HelperFunctions.navigateToScreen(
                      context,
                      ProductCategoryView(
                          title: "", categoryId: banner.itemId!));
                }
              }
            },
            child: AdItem(
              banner: homeCubit.bannersList[index],
            ),
          );
        },
      ),
    );
  }
}
