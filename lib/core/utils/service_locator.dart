import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/feature/auth/forget_password/data/forget_password_repo/forget_password_repo.dart';
import 'package:best_price/feature/auth/forget_password/data/forget_password_repo/forget_password_repo_impl.dart';
import 'package:best_price/feature/auth/login/data/login_repo/login_repo.dart';
import 'package:best_price/feature/auth/login/data/login_repo/login_repo_impl.dart';
import 'package:best_price/feature/auth/sign_up/data/signup_repo/signup_repo.dart';
import 'package:best_price/feature/auth/sign_up/data/signup_repo/signup_repo_imple.dart';
import 'package:best_price/feature/category/data/repo/category_repo.dart';
import 'package:best_price/feature/category/data/repo/category_repo_impl.dart';
import 'package:best_price/feature/home/data/home_repo/home_repo.dart';
import 'package:best_price/feature/home/data/home_repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: "https://bp.linekw.xyz/api/",
      ),
    ),
  );

  getIt.registerSingleton<ApiService>(
    ApiService(
      getIt.get<Dio>(),
    ),
  );
  getIt.registerSingleton<SignUprRepo>(SignUpRepoImpl());
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl());
  getIt.registerSingleton<ForgetPasswordRepo>(ForgetPasswordRepoImpl());
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl());
  getIt.registerSingleton<CategoryRepo>(CategoryRepoImpl());
}
