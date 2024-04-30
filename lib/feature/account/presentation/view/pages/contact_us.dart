import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/validate.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/presentation/manager/contact_us_cubit/contact_us_cubit.dart';
import 'package:best_price/feature/account/presentation/view/widgets/susses_account_dialog.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});
// todo : finish translates
  @override
  Widget build(BuildContext context) {
    ContactUsCubit contactUsCubit = ContactUsCubit.get(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(
            height: 14.h,
          ),
          AppBarRow(
            iconPath: IconsPath.arrowLeftIcon,
            title: S.of(context).contact_us, //"Contact Us",
          ),
          SizedBox(
            height: 41.h,
          ),
          Form(
            key: contactUsCubit.contactUsFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthFieldText(
                  title: S.of(context).full_name_, //"Full Name*",
                ),
                SizedBox(
                  height: 8.h,
                ),
                AuthTextField(
                  textEditingController: contactUsCubit.fullNameController,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 25.h,
                ),
                AuthFieldText(
                  title: S.of(context).mobile_number_, // "Mobile Number*",
                ),
                SizedBox(
                  height: 8.h,
                ),
                AuthTextField(
                  textEditingController: contactUsCubit.mobileNumberController,
                  validator: (p0) {
                    return Validate.validatePhoneNumber(context, p0);
                  },
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                AuthFieldText(
                  title: S.of(context).email_, //"Email*",
                ),
                SizedBox(
                  height: 8.h,
                ),
                AuthTextField(
                  textEditingController: contactUsCubit.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (p0) {
                    return Validate.validateEmail(context, p0);
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                AuthFieldText(
                  title: S.of(context).message_, // "Message*",
                ),
                SizedBox(
                  height: 8.h,
                ),
                AuthTextField(
                  textEditingController: contactUsCubit.messageController,
                  keyboardType: TextInputType.multiline,
                  validator: (p0) {
                    return Validate.validateFailed(context, p0);
                  },
                  minLine: 4,
                  maxLine: 4,
                ),
                SizedBox(
                  height: 39.h,
                ),
                BlocConsumer<ContactUsCubit, ContactUsState>(
                  listener: (context, state) {
                    if (state is ContactUsSusses) {
                      if (state.response.status) {
                        HelperFunctions.showCustomDialog(
                          context,
                          UpdateAccountDialog(
                            title: S.of(context).success, //"susses",
                            contain: S.of(context).ok, // " Ok",
                          ),
                        );
                      } else {
                        HelperFunctions.showCustomDialog(
                          context,
                          UpdateAccountDialog(
                            title: S.of(context).error, //"error",
                            contain: state.response.message ?? "",
                          ),
                        );
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is ContactUsLoading) {
                      return const Center(
                        child: CustomCircularProgressIndicator(),
                      );
                    } else {
                      return AppBottom(
                        title: S.of(context).submit, //"Submit",
                        onTap: () async {
                          await contactUsCubit.contactUs();
                        },
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 53.h,
                ),
                Text(
                  S.of(context).reach_out_to_us, //'Reach Out to Us',
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle18w700.copyWith(
                    color: AppColor.silver,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 50.h,
                  child: ListView.builder(
                    itemCount: contactUsCubit.iconList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(end: 19.w),
                        child: SvgPicture.asset(contactUsCubit.iconList[index]),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 82.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
