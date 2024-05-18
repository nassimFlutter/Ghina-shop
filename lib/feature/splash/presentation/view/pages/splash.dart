import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:best_price/feature/splash/presentation/manager/connectivity_cubit/connectivity_cubit.dart';
import 'package:best_price/feature/splash/presentation/view/pages/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    ConnectivityCubit().checkInternetStatus();
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ConnectivityCubit, ConnectivityState>(
          listener: (context, state) {
            if (state is Connected) {
              HelperFunctions.navigateToScreenAndRemove(
                  context, const OnBoardingView());
            } else if (state is Disconnected) {
              HelperFunctions.navigateToScreenAndRemove(
                  context, const NoInternetScreen());
            }
          },
          builder: (context, state) {
            return const SplashViewBody();
          },
        ),
      ),
    );
  }
}
