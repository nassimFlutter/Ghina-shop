import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/on_boarding/presentation/manager/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageList extends StatelessWidget {
  const ImageList({
    super.key,
    required this.onBoardingCubit,
  });

  final OnBoardingCubit onBoardingCubit;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: onBoardingCubit.onBoardingPageController,
      itemCount: 3,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 852.h / 393.w,
          child: Image.asset(
            ImagePath.adImage,
            width: HelperFunctions.getScreenWidth(context),
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
