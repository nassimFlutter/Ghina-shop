import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/on_boarding/presentation/manager/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageView extends StatelessWidget {
  const SmoothPageView({
    super.key,
    required this.onBoardingCubit,
  });

  final OnBoardingCubit onBoardingCubit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: HelperFunctions.getScreenHight(context) * 0.06,
      left: HelperFunctions.getScreenWidth(context) * 0.06,
      child: SmoothPageIndicator(
        controller: onBoardingCubit.onBoardingPageController,
        effect: const ExpandingDotsEffect(
            dotColor: AppColor.whiteColorOpacity,
            offset: 4,
            radius: 4,
            activeDotColor: AppColor.whiteColorOpacity,
            dotHeight: 8,
            dotWidth: 8),
        count: 3,
      ),
    );
  }
}
