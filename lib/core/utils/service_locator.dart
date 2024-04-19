import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/feature/account/data/repo/contact_us_repo/contact_us_repo.dart';
import 'package:best_price/feature/account/data/repo/contact_us_repo/contact_us_repo_impl.dart';
import 'package:best_price/feature/account/data/repo/edit_account_repo/edit_account_repo.dart';
import 'package:best_price/feature/account/data/repo/edit_account_repo/edit_account_repo_imple.dart';
import 'package:best_price/feature/account/data/repo/static_page_repo/static_page_repo.dart';
import 'package:best_price/feature/account/data/repo/static_page_repo/static_page_repo_impl.dart';
import 'package:best_price/feature/auth/forget_password/data/forget_password_repo/forget_password_repo.dart';
import 'package:best_price/feature/auth/forget_password/data/forget_password_repo/forget_password_repo_impl.dart';
import 'package:best_price/feature/auth/login/data/login_repo/login_repo.dart';
import 'package:best_price/feature/auth/login/data/login_repo/login_repo_impl.dart';
import 'package:best_price/feature/auth/sign_up/data/signup_repo/signup_repo.dart';
import 'package:best_price/feature/auth/sign_up/data/signup_repo/signup_repo_imple.dart';
import 'package:best_price/feature/best_selling/data/best_selling_repo/best_selling_repo.dart';
import 'package:best_price/feature/best_selling/data/best_selling_repo/best_selling_repo_impl.dart';
import 'package:best_price/feature/brands/data/repo/brand_repo.dart';
import 'package:best_price/feature/brands/data/repo/brand_repo_impl.dart';
import 'package:best_price/feature/category/data/repo/category_repo.dart';
import 'package:best_price/feature/category/data/repo/category_repo_impl.dart';
import 'package:best_price/feature/featured_products/data/featured_producte_repo/featured_producte_repo.dart';
import 'package:best_price/feature/featured_products/data/featured_producte_repo/featured_producte_repo_impl.dart';
import 'package:best_price/feature/home/data/home_repo/home_repo.dart';
import 'package:best_price/feature/home/data/home_repo/home_repo_impl.dart';
import 'package:best_price/feature/new_arrivals/data/repo/new_arrivals_repo/new_arrivals_repo.dart';
import 'package:best_price/feature/new_arrivals/data/repo/new_arrivals_repo/new_arrivals_repo_imple.dart';
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
  getIt.registerSingleton<BrandRepo>(BrandRepoImpl());
  getIt.registerSingleton<EditAccountRepo>(EditAccountRepoImpl());
  getIt.registerSingleton<ContactUsRepo>(ContactUsRepoImpl());
  getIt.registerSingleton<FeaturedProductRepo>(FeaturedProductsRepoImpl());
  getIt.registerSingleton<BestSellingRepo>(BestSellingRepoImpl());
  getIt.registerSingleton<NewArrivalsProductsRepo>(
      NewArrivalsProductsRepoImpl());
  getIt.registerSingleton<StaticPageRepo>(
      StaticPageRepoImpl());
}
