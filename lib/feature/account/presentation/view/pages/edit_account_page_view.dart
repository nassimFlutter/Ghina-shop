import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/presentation/manager/edit_account_cubit/edit_account_cubit.dart';
import 'package:best_price/feature/account/presentation/view/pages/terminate_account_view.dart';
import 'package:best_price/feature/account/presentation/view/widgets/susses_account_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/app_bar_row.dart';
import '../widgets/edit_account_form.dart';
import '../widgets/terminate_account_bottom.dart';

class EditAccountView extends StatelessWidget {
  const EditAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    EditAccountCubit editAccountCubit = EditAccountCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          children: [
            SizedBox(
              height: 14.h,
            ),
            const AppBarRow(
              iconPath: IconsPath.arrowLeftIcon,
              title: "edit Account",
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
                      const UpdateAccountDialog(
                        contain: "Your Account Has been\nsuccessfully updated",
                        title: "Update Account",
                      ));
                } else if (state is EditAccountFailure) {
                  HelperFunctions.showCustomDialog(
                      context,
                      const UpdateAccountDialog(
                        contain: "Your Account Has not \nsuccessfully updated",
                        title: "Update Account",
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
                      title: "update",
                      onTap: () async {
                        await editAccountCubit.updateUserAccount();
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 211.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 16.w),
              child: TerminateAccountBottom(
                onTap: () {
                  HelperFunctions.showCustomDialog(
                      context, const TerminateAccountView());
                },
              ),
            ),
            SizedBox(
              height: 64.h,
            ),
          ],
        ),
      ),
    );
  }
}
