import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/no_internet.dart';
import 'package:best_price/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:best_price/feature/splash/presentation/manager/connectivity_cubit/connectivity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    ConnectivityCubit().checkInternetStatus();
    return Scaffold(
      body: BlocConsumer<ConnectivityCubit, ConnectivityState>(
        listener: (context, state) {
          if (state is Connected) {
            HelperFunctions.navigateToScreen(context, const OnBoardingView());
          } else {
            HelperFunctions.navigateToScreen(context, const OnBoardingView());
          }
        },
        builder: (context, state) {
          return const SplashViewBody();
        },
      ),
    );
  }
}
