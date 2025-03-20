import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:best_price/feature/splash/presentation/manager/connectivity_cubit/connectivity_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ConnectivityCubit, ConnectivityState>(
        listener: (context, state) {
          if (state is Connected) {
            HelperFunctions.navigateToScreenAndRemove(
                context, const OnBoardingView());
          }
        },
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                IconsPath.disconnectedIcon,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                    AppColor.buddhaGold, BlendMode.srcIn),
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
                  BlocProvider.of<ConnectivityCubit>(context)
                      .checkInternetStatus();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
