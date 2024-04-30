import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/feature/account/presentation/manager/our_policy_tab_change/our_policy_tab_change_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/policy_card.dart';

class OurPolicyView extends StatelessWidget {
  const OurPolicyView({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    OurPolicyTabChangeCubit ourPolicyTabChangeCubit =
        OurPolicyTabChangeCubit.get(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        children: [
          SizedBox(
            height: 14.h,
          ),
          AppBarRow(
            iconPath: IconsPath.arrowLeftIcon,
            title: S.of(context).our_policy, //"Our Policy",
          ),
          SizedBox(
            height: 35.h,
          ),
          SizedBox(
            height: 60.h,
            child: BlocBuilder<OurPolicyTabChangeCubit, OurPolicyState>(
              builder: (context, state) {
                return PolicyCardList(
                  ourPolicyTabChangeCubit: ourPolicyTabChangeCubit,
                );
              },
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          BlocBuilder<OurPolicyTabChangeCubit, OurPolicyState>(
            builder: (context, state) {
              if (ourPolicyTabChangeCubit.currentIndex == 0) {
                return Text(
                  S
                      .of(context)
                      .welcome_policy_message, //"Welcome to Best Price We respect your privacy and are committed to protecting your personal information. This Privacy Policy is designed to help you understand how we collect, use, disclose, and safeguard your personal information. By using our website or mobile application, you consent to the practices described in this Privacy Policy.Information We CollectPersonal Information: We may collect personal information that you provide to us, such as your name, email address, postal address, phone number, and other similar information.Usage Information: We may collect information about your use of our services, including but not limited to your IP address, device information, browser type, and operating system.",
                  style: AppStyles.textStyle16w400
                      .copyWith(height: 2, color: Colors.black),
                );
              } else {
                return Text(
                  S
                      .of(context)
                      .return_policy_data, // "Return Policy data .....",
                  style: AppStyles.textStyle16w400
                      .copyWith(height: 2, color: Colors.black),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class PolicyCardList extends StatelessWidget {
  const PolicyCardList({
    super.key,
    required this.ourPolicyTabChangeCubit,
  });
  // todo : finish translate
  final OurPolicyTabChangeCubit ourPolicyTabChangeCubit;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      itemCount: 2,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            ourPolicyTabChangeCubit.changeTab(index);
          },
          child: PolicyCard(
            index: index,
            selectedIndex: ourPolicyTabChangeCubit.currentIndex,
            title: S.of(context).privacy_policy, //'Privacy Policy',
          ),
        );
      },
    );
  }
}
