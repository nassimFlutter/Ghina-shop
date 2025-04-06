import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/feature/on_boarding/presentation/widgets/selected_language.dart';
import 'package:best_price/feature/splash/presentation/manager/lang_cubit/lang_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LangCubit langCubit = LangCubit.get(context);
    return SizedBox(
      height: 270.h,
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              SelectedLanguage(
                visible: langCubit.lang == "en",
                title: "english",
                languageLetter: "EN",
                imagePath: IconsPath.kingdom,
                borderSide: BorderSide(
                  width: langCubit.lang == "en" ? 1 : 0,
                  color: langCubit.lang == "en"
                      ? AppColor.pirateGold
                      : Colors.white,
                ),
                onTap: () {
                  langCubit.changeLang(context, language: "en");
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              SelectedLanguage(
                languageLetter: "AR",
                visible: langCubit.lang == "ar",
                title: "العربية",
                imagePath: IconsPath.kuwait,
                borderSide: BorderSide(
                  width: langCubit.lang == "ar" ? 1 : 0,
                  color: langCubit.lang == "ar"
                      ? AppColor.pirateGold
                      : Colors.white,
                ),
                onTap: () {
                  langCubit.changeLang(context, language: "ar");
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
