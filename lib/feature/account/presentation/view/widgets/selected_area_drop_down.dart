import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/feature/account/data/models/area_model/area_model.dart';
import 'package:best_price/feature/account/presentation/manager/area_cubit/area_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SelectedAreaDropDown extends StatelessWidget {
  const SelectedAreaDropDown({
    super.key,
    required this.areaCubit,
    this.validator,
  });
// todo : finish translate
  final AreaCubit areaCubit;
  final String? Function(Item?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 16.w),
      child: DropdownButtonFormField<Item>(
        value: areaCubit.selectAreaDropDown,
        borderRadius: BorderRadius.circular(
          5,
        ),
        style: AppStyles.textStyle16w400,
        items: areaCubit.allAreas
            .map(
              (e) => DropdownMenuItem<Item>(
                value: e,
                child: Text(e.name ?? ""),
              ),
            )
            //! very important put this toSet
            .toSet()
            .toList(),
        onChanged: (value) {
          areaCubit.selectedAreaId = value?.id;
        },
        validator: validator,
        // validator: (value) {
        //   if (value == null) {
        //     return S
        //         .of(context)
        //         .please_select_an_area; //'Please select an area'; // Validation error message
        //   }
        //   return null; // No validation error
        // },
        icon: SvgPicture.asset(
          IconsPath.dropDownIcon,
        ),
        decoration: InputDecoration(
          hintText: S.of(context).enter_here,
          errorStyle: AppStyles.textStyle14.copyWith(color: Colors.red[400]),
          // contentPadding: EdgeInsetsDirectional.only(start: 16.w, top: 6.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide:
                const BorderSide(width: 2, color: AppColor.failedBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide:
                const BorderSide(width: 2, color: AppColor.failedBorderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide:
                const BorderSide(width: 2, color: AppColor.failedBorderColor),
          ),
          hintStyle: AppStyles.textStyle14.copyWith(color: AppColor.silver),
        ),
      ),
    );
  }
}
