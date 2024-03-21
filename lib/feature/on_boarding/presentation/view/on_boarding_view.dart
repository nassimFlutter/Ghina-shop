import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/on_boarding/presentation/manager/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: onBoardingCubit.onBoardingPageController,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 2,
                child: Image.asset(
                  ImagePath.adImage,
                  width: HelperFunctions.getScreenWidth(context),
                  height: HelperFunctions.getScreenHight(context),
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Positioned(
            bottom: HelperFunctions.getScreenHight(context) * 0.06,
            left: HelperFunctions.getScreenWidth(context) * 0.06,
            child: SmoothPageIndicator(
              controller: onBoardingCubit.onBoardingPageController,
              effect: const ExpandingDotsEffect(
                  activeDotColor: AppColor.silver, dotHeight: 6),
              count: 2,
            ),
          )
        ],
      ),
    );
  }
}
