import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/no_internet.dart';
import 'package:best_price/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:best_price/feature/splash/presentation/manager/connectivity_cubit/connectivity_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              IconsPath.disconnectedIcon,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 41.h,
          ),
          Text(
            S.of(context).NO_CONNECTION, // "NO CONNECTION",
            style: AppStyles.textStyle16w700.copyWith(color: AppColor.black),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            S
                .of(context)
                .connection_not_found, //  "Connection not found, make sure you are\nconnected to internet",
            style: AppStyles.textStyle16w400,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 163.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: AppBottom(
              title: S.of(context).retry, //"Retry",
              onTap: () async {
                ConnectivityCubit().checkInternetStatus();
              },
            ),
          )
        ],
      ),
    );
  }
}
