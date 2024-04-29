import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.controller,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 315.w,
      height: 50.h,
      padding: EdgeInsetsDirectional.zero,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColor.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle:
                AppStyles.textStyle14.copyWith(color: AppColor.greyOpacity),
            prefixIcon: Padding(
                padding: EdgeInsetsDirectional.only(start: 11.w, end: 12.w),
                child: SvgPicture.asset(IconsPath.searchIcon,
                    color: AppColor.greyOpacity)),
            border: InputBorder.none,
            contentPadding: const EdgeInsetsDirectional.only(top: 5)),
      ),
    );
  }
}
