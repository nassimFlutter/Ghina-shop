import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class CustomDropDownFormField extends StatelessWidget {
  const CustomDropDownFormField({
    super.key,
    required this.hintText,
    required this.listItem,
    this.onChanged,
    this.validator,
    this.value,
  });
  final String hintText;
  final List<dynamic> listItem;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: DropdownButtonFormField(
        value: value,
        validator: validator,
        borderRadius: BorderRadius.circular(
          5,
        ),
        style: AppStyles.textStyle16w400,
        items: listItem
            .map(
              (e) => DropdownMenuItem(
                value: e.toString(),
                child: Text(e.toString()),
              ),
            )
            .toList(),
        onChanged: onChanged,
        icon: SvgPicture.asset(IconsPath.cancelIcon),
        decoration: InputDecoration(
          errorStyle: AppStyles.textStyle16w700,
          hintText: hintText,
          hintStyle: AppStyles.textStyle16w700,
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20.w,
          ),

          // enabledBorder: null,
          // (!withoutFocusedBorder)
          //     ? OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: const BorderSide(
          //             color: AppColor.borderSearchColor, width: 2),
          //       )
          //     : null,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
