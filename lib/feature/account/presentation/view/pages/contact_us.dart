import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/account/presentation/manager/contact_us_cubit/contact_us_cubit.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
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
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthFieldText(title: "Full Name*"),
              SizedBox(
                height: 8.h,
              ),
              AuthTextField(
                  textEditingController: contactUsCubit.fullNameController),
              SizedBox(
                height: 25.h,
              ),
              const AuthFieldText(title: "Mobile Number*"),
              SizedBox(
                height: 8.h,
              ),
              AuthTextField(
                  textEditingController: contactUsCubit.mobileNumberController),
              SizedBox(
                height: 25.h,
              ),
              const AuthFieldText(title: "Email*"),
              SizedBox(
                height: 8.h,
              ),
              AuthTextField(
                  textEditingController: contactUsCubit.emailController),
              SizedBox(
                height: 25.h,
              ),
              const AuthFieldText(title: "Message*"),
              SizedBox(
                height: 8.h,
              ),
              AuthTextField(
                textEditingController: contactUsCubit.messageController,
                minLine: 4,
                maxLine: 4,
              ),
              SizedBox(
                height: 39.h,
              ),
              const AppBottom(title: "Submit"),
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
                      child: SvgPicture.asset(contactUsCubit.iconList[index]),
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
