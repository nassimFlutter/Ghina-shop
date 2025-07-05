import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/account/presentation/view/pages/guest_page_view.dart';
import 'package:best_price/feature/account/presentation/view/pages/my_account_page_view.dart';
import 'package:best_price/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:best_price/feature/cart/presentation/view/cart_view_body.dart';
import 'package:best_price/feature/category/presentaion/view/pages/category_body.dart';
import 'package:best_price/feature/home/presentation/view/widgets/home_page_body.dart';
import 'package:best_price/feature/stores/presntation/view/stores_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  static NavBarCubit get(context) => BlocProvider.of(context);

  List<Widget> get screens {
    bool isGuest = HelperFunctions.isGuest();
    return [
      const HomePgeBody(),
      const CategoryViewBody(),
      const StoresPageView(),
      const CartViewBody(),
      if (isGuest) const GuestPageView() else const MyAccountViewBody(),
    ];
  }

  void changeTab(int index, BuildContext context) {
    bool isGuest = HelperFunctions.isGuest();
    if (index == 2 && isGuest) {
      HelperFunctions.navigateToScreen(context, const LoginView());
    }
    emit(ChangeTab(index: index));
  }
}
