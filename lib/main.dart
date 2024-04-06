import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/utils/bloc_observer.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/presentation/manager/add_address/add_address_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/change_address_page/change_address_page_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/contact_us_cubit/contact_us_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/our_policy_tab_change/our_policy_tab_change_cubit.dart';
import 'package:best_price/feature/auth/forget_password/presentation/manager/cubit/forget_password_cubit.dart';
import 'package:best_price/feature/auth/login/presentation/manager/cubit/login_cubit.dart';
import 'package:best_price/feature/auth/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:best_price/feature/category/presentaion/manager/category_cubit/category_cubit.dart';
import 'package:best_price/feature/category/presentaion/manager/category_product_cubit/category_product_cubit.dart';
import 'package:best_price/feature/flitter_sort/presentaion/manager/flitter_cubit/flitter_cubit.dart';
import 'package:best_price/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:best_price/feature/home/presentation/manager/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:best_price/feature/on_boarding/presentation/manager/cubit/on_boarding_cubit.dart';
import 'package:best_price/feature/splash/presentation/manager/connectivity_cubit/connectivity_cubit.dart';
import 'package:best_price/feature/splash/presentation/view/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupServiceLocator();
  CacheHelper.cacheInit();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConnectivityCubit(),
        ),
        BlocProvider(
          create: (context) => OnBoardingCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeAddressPageCubit(),
        ),
        BlocProvider(
          create: (context) => AddAddressCubit(),
        ),
        BlocProvider(
          create: (context) => SendForgetPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => OurPolicyTabChangeCubit(),
        ),
        BlocProvider(
          create: (context) => ContactUsCubit(),
        ),
        BlocProvider(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => FlitterCubit(),
        ),
        BlocProvider(
          create: (context) => SendForgetPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit()..fetchAllCategory(),
        ),
        BlocProvider(
          create: (context) => CategoryProductCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Best Price',
          theme: ThemeData(
            backgroundColor: Colors.white,
            useMaterial3: true,
          ),
          home: const SplashView(),
        ),
      ),
    );
  }
}
