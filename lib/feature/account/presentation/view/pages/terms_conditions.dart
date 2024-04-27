import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/presentation/manager/static_page_cubit/static_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    StaticPageCubit staticPageCubit = StaticPageCubit.get(context);
    staticPageCubit.getStaticPageById(3);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(
            height: 14.h,
          ),
          const AppBarRow(
              iconPath: IconsPath.arrowLeftIcon, title: "Terms & Conditions"),
          SizedBox(
            height: 24.h,
          ),
          BlocBuilder<StaticPageCubit, StaticPageState>(
            builder: (context, state) {
              if (state is StaticPageLoading) {
                return const Center(
                  child: CustomCircularProgressIndicator(),
                );
              } else {
                return Text(
                  "FuckData.termText,",
                  style: AppStyles.textStyle16w400
                      .copyWith(color: Colors.black, height: 2),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
