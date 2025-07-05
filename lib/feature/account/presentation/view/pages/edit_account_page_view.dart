import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/presentation/manager/edit_account_cubit/edit_account_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:best_price/feature/account/presentation/view/widgets/susses_account_dialog.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/app_bar_row.dart';
import '../widgets/edit_account_form.dart';

class EditAccountView extends StatelessWidget {
  const EditAccountView({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    EditAccountCubit editAccountCubit = EditAccountCubit.get(context);
    editAccountCubit.initTextController();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          children: [
            SizedBox(
              height: 14.h,
            ),
            AppBarRow(
              iconPath: IconsPath.arrowLeftIcon,
              title: S.of(context).edit_account, //"edit Account",
            ),
            SizedBox(
              height: 42.h,
            ),
            const EditAccountForm(),
            SizedBox(
              height: 85.h,
            ),
            BlocConsumer<EditAccountCubit, EditAccountState>(
              listener: (context, state) {
                if (state is EditAccountSuccess) {
                  HelperFunctions.showCustomDialog(
                      context,
                      UpdateAccountDialog(
                        contain: S
                            .of(context)
                            .success_update_message, // "Your Account Has been\nsuccessfully updated",
                        title: S.of(context).update_account, //"Update Account",
                      ));

                  GetUserInfoCubit.get(context).getUserInfo();
                } else if (state is EditAccountFailure) {
                  editAccountCubit.initTextController();
                  HelperFunctions.showCustomDialog(
                      context,
                      UpdateAccountDialog(
                        contain: S
                            .of(context)
                            .failure_update_message, //"Your Account Has not \nsuccessfully updated",
                        title: S
                            .of(context)
                            .update_account_error, // "Update Account Error",
                      ));
                }
              },
              builder: (context, state) {
                if (state is EditAccountLoading) {
                  return const Center(
                    child: CustomCircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(end: 16.w),
                    child: AppBottom(
                      title: S.of(context).update, //"update",
                      onTap: () async {
                        await editAccountCubit.updateUserAccount();
                      },
                    ),
                  );
                }
              },
            ),
            // SizedBox(
            //   height: 211.h,
            // ),
            // Padding(
            //   padding: EdgeInsetsDirectional.only(end: 16.w),
            //   child: TerminateAccountBottom(
            //     onTap: () {
            //       HelperFunctions.showCustomDialog(
            //           context, const TerminateAccountView());
            //     },
            //   ),
            // ),
            SizedBox(
              height: 64.h,
            ),
          ],
        ),
      ),
    );
  }
}
