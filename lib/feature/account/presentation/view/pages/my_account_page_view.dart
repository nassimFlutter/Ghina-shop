import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:best_price/feature/account/presentation/view/widgets/copy_rights_widgets.dart';
import 'package:best_price/feature/account/presentation/view/widgets/options_list_title.dart';
import 'package:best_price/feature/account/presentation/view/widgets/settings_list_options.dart';
import 'package:best_price/feature/account/presentation/view/widgets/support_list_options.dart';
import 'package:best_price/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/my_account_info.dart';
import '../widgets/my_account_options.dart';

class MyAccountViewBody extends StatelessWidget {
  const MyAccountViewBody({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    LogoutCubit logoutCubit = LogoutCubit.get(context);
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          if (logoutCubit.logoutResponse.status) {
            HelperFunctions.navigateToScreenAndRemove(
                context, const LoginView());
            CacheHelper.setData(key: Keys.kIsLogin, value: false);
          }
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LogoutLoading,
          progressIndicator: const CustomCircularProgressIndicator(),
          child: SafeArea(
            child: ListView(
              padding: EdgeInsetsDirectional.only(start: 16.w),
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 14.h),
                  child: Text(
                    S.of(context).my_account,
                    style: AppStyles.textStyle20w700,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.w),
                  child: const MyAccountInfo(),
                ),
                SizedBox(
                  height: 30.h,
                ),
                OptionsListTitle(
                  title: S.of(context).my_account,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.w),
                  child: const MyAccountOptions(),
                ),
                SizedBox(
                  height: 30.h,
                ),
                OptionsListTitle(
                  title: S.of(context).settings, //"Settings",
                ),
                SizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.w),
                  child: const SettingsListOptions(),
                ),
                SizedBox(
                  height: 30.h,
                ),
                OptionsListTitle(
                  title: S.of(context).support, //"Support",
                ),
                SizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.w),
                  child: const SupportListOptions(),
                ),
                SizedBox(
                  height: 28.h,
                ),
                const CopyRightsWidgets(),
                SizedBox(
                  height: 19.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
