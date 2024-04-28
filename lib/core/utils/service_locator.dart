import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/feature/account/data/repo/address_repo/address_repo.dart';
import 'package:best_price/feature/account/data/repo/address_repo/address_repo_impl.dart';
import 'package:best_price/feature/account/data/repo/area_repo/area_repo.dart';
import 'package:best_price/feature/account/data/repo/area_repo/area_repo_impl.dart';
import 'package:best_price/feature/account/data/repo/chnage_password_repo/change_password_repo.dart';
import 'package:best_price/feature/account/data/repo/chnage_password_repo/change_password_repo_impl.dart';
import 'package:best_price/feature/account/data/repo/contact_us_repo/contact_us_repo.dart';
import 'package:best_price/feature/account/data/repo/contact_us_repo/contact_us_repo_impl.dart';
import 'package:best_price/feature/account/data/repo/edit_account_repo/edit_account_repo.dart';
import 'package:best_price/feature/account/data/repo/edit_account_repo/edit_account_repo_imple.dart';
import 'package:best_price/feature/account/data/repo/logout_repo/logout_repo.dart';
import 'package:best_price/feature/account/data/repo/logout_repo/logout_repo_impl.dart';
import 'package:best_price/feature/account/data/repo/order_repo/order_repo.dart';
import 'package:best_price/feature/account/data/repo/order_repo/order_repo_impl.dart';
import 'package:best_price/feature/account/data/repo/setting_repo/setting_repo.dart';
import 'package:best_price/feature/account/data/repo/setting_repo/setting_repo_impl.dart';
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
import 'package:best_price/feature/cart/data/repos/cart_repo/cart_repo.dart';
import 'package:best_price/feature/cart/data/repos/cart_repo/cart_repo_impl.dart';
import 'package:best_price/feature/category/data/repo/category_repo.dart';
import 'package:best_price/feature/category/data/repo/category_repo_impl.dart';
import 'package:best_price/feature/featured_products/data/featured_producte_repo/featured_producte_repo.dart';
import 'package:best_price/feature/featured_products/data/featured_producte_repo/featured_producte_repo_impl.dart';
import 'package:best_price/feature/home/data/home_repo/home_repo.dart';
import 'package:best_price/feature/home/data/home_repo/home_repo_impl.dart';
import 'package:best_price/feature/new_arrivals/data/repo/new_arrivals_repo/new_arrivals_repo.dart';
import 'package:best_price/feature/new_arrivals/data/repo/new_arrivals_repo/new_arrivals_repo_imple.dart';
import 'package:best_price/feature/wish/data/repo/wish_repo.dart';
import 'package:best_price/feature/wish/data/repo/wish_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feature/product_details/data/repo/product_details_repo.dart';
import '../../feature/product_details/data/repo/product_details_repo_impl.dart';

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
  getIt.registerSingleton<StaticPageRepo>(StaticPageRepoImpl());
  getIt.registerSingleton<SettingRepo>(SettingRepoImpl());
  getIt.registerSingleton<CartRepo>(CartRepoImpl());
  getIt.registerSingleton<AreaRepo>(AreaRepoImpl());
  getIt.registerSingleton<AddressRepo>(AddressRepoImpl());
  getIt.registerSingleton<WishRepo>(WishRepoImpl());
  getIt.registerSingleton<ChangePasswordRepo>(ChangePasswordRepoImpl());
  getIt.registerSingleton<LogoutRepo>(LogoutRepoImpl());
  getIt.registerSingleton<ProductDetailsRepo>(ProductDetailsRepoImpl());
  getIt.registerSingleton<OrderRepo>(OrderRepoImpl());
}
