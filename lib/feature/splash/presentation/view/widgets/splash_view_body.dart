import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/feature/splash/presentation/manager/connectivity_cubit/connectivity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      BlocProvider.of<ConnectivityCubit>(context).checkInternetStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double screenHeight = constraints.maxHeight;
        final double screenWidth = constraints.maxWidth;

        return Stack(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: SvgPicture.asset(
                ImagePath.splashImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: screenWidth * 0.1,
              right: screenWidth * 0.1,
              top: screenHeight * 0.27,
              child: SvgPicture.asset(
                ImagePath.splashLogo,
                width: screenWidth * 0.8,
                height: screenHeight * 0.2,
              ),
            ),
          ],
        );
      },
    );
  }
}
