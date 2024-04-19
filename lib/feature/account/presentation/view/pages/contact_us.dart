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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

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
          const AppBarRow(
              iconPath: IconsPath.arrowLeftIcon, title: "Contact Us"),
          SizedBox(
            height: 41.h,
          ),
          Form(
              key: contactUsCubit.contactUsFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthFieldText(title: "Full Name*"),
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
                  const AuthFieldText(title: "Mobile Number*"),
                  SizedBox(
                    height: 8.h,
                  ),
                  AuthTextField(
                    textEditingController:
                        contactUsCubit.mobileNumberController,
                    validator: Validate.validatePhoneNumber,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const AuthFieldText(title: "Email*"),
                  SizedBox(
                    height: 8.h,
                  ),
                  AuthTextField(
                    textEditingController: contactUsCubit.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validate.validateEmail,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const AuthFieldText(title: "Message*"),
                  SizedBox(
                    height: 8.h,
                  ),
                  AuthTextField(
                    textEditingController: contactUsCubit.messageController,
                    keyboardType: TextInputType.multiline,
                    validator: Validate.validateFailed,
                    
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
                              const UpdateAccountDialog(
                                  title: "susses", contain: "Ok"));
                        } else {
                          HelperFunctions.showCustomDialog(
                              context,
                              UpdateAccountDialog(
                                  title: "error", contain: state.response.message??""));
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
                          title: "Submit",
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
                  Text('Reach Out to Us',
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyle18w700
                          .copyWith(color: AppColor.silver)),
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
                          child:
                              SvgPicture.asset(contactUsCubit.iconList[index]),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 82.h,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
