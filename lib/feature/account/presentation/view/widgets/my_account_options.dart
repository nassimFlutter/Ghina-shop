import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/question_dialog.dart';
import 'package:best_price/feature/account/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:best_price/feature/account/presentation/view/pages/edit_account_page_view.dart';
import 'package:best_price/feature/account/presentation/view/pages/change_password_page_view.dart';
import 'package:best_price/feature/account/presentation/view/pages/my_address_page_view.dart';
import 'package:best_price/feature/account/presentation/view/widgets/my_orders_view.dart';
import 'package:best_price/feature/account/presentation/view/widgets/option_item.dart';
import 'package:best_price/feature/wish/presentation/view/view/my_wish_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAccountOptions extends StatelessWidget {
  const MyAccountOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LogoutCubit logoutCubit = LogoutCubit.get(context);
     
        return Container(
          decoration: AppStyles.accountContainerDecoration(),
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              OptionItem(
                  onTap: () {
                    HelperFunctions.navigateToScreen(
                        context, const EditAccountView());
                  },
                  trailing: SvgPicture.asset(IconsPath.rightArrowIcon),
                  title: "Edit Account",
                  iconPath: IconsPath.editAccountIcon),
              OptionItem(
                  onTap: () {
                    HelperFunctions.navigateToScreen(context, const MyOrders());
                  },
                  trailing: SvgPicture.asset(IconsPath.rightArrowIcon),
                  title: "My Orders",
                  iconPath: IconsPath.policiesIcon),
              OptionItem(
                  onTap: () {
                    HelperFunctions.navigateToScreen(
                        context, const MyAddressView());
                  },
                  trailing: SvgPicture.asset(IconsPath.rightArrowIcon),
                  title: "My Addresses",
                  iconPath: IconsPath.addressesIcon),
              OptionItem(
                  onTap: () {
                    HelperFunctions.navigateToScreen(
                        context, const MyWishView());
                  },
                  trailing: SvgPicture.asset(IconsPath.rightArrowIcon),
                  title: "Wish list",
                  iconPath: IconsPath.wishIcon),
              OptionItem(
                  onTap: () {
                    HelperFunctions.navigateToScreen(
                        context, const ForgetPasswordView());
                  },
                  trailing: SvgPicture.asset(IconsPath.rightArrowIcon),
                  title: "Change Password",
                  iconPath: IconsPath.changeIcon),
              OptionItem(
                  onTap: () async {
                    HelperFunctions.showCustomDialog(
                        context,
                        QuestionDialog(
                          title: "Logout",
                          contain: "Are you sure you want to logout?",
                          onTapYes: () async {
                            await logoutCubit.logout();
                          },
                        ));
                  },
                  trailing: SvgPicture.asset(IconsPath.rightArrowIcon),
                  title: "Logout",
                  iconPath: IconsPath.logoutIcon),
              SizedBox(
                height: 25.h,
              )
            ],
          ),
        );
      }
    
  }
