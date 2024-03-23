import 'package:best_price/feature/on_boarding/presentation/manager/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';

import '../widgets/image_list.dart';
import '../widgets/skip_bottom.dart';
import '../widgets/smooth_page_view.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
    return Scaffold(
      body: ListView(children: [
        Stack(
          children: [
            ImageList(onBoardingCubit: onBoardingCubit),
            SmoothPageView(onBoardingCubit: onBoardingCubit),
            const SkipBottom(),
          ],
        ),
      ]),
    );
  }
}
