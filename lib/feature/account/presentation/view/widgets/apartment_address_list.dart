import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/validate.dart';
import 'package:best_price/feature/account/data/models/area_model/area_model.dart';
import 'package:best_price/feature/account/presentation/manager/add_address/add_address_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/area_cubit/area_cubit.dart';
import 'package:best_price/feature/account/presentation/view/widgets/drop_down.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ApartmentAddressList extends StatelessWidget {
  const ApartmentAddressList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddAddressCubit addAddressCubit = AddAddressCubit.get(context);
    AreaCubit areaCubit = AreaCubit.get(context);

    return Form(
      key: addAddressCubit.formKey,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const AuthFieldText(title: "Address Title*"),
          SizedBox(
            height: 6.h,
          ),
          AuthTextField(
            textEditingController: addAddressCubit.addressTitleController,
            keyboardType: TextInputType.text,
            validator: Validate.validateFailed,
          ),
          SizedBox(
            height: 25.h,
          ),
          const AuthFieldText(title: "Mobile No*"),
          SizedBox(
            height: 6.h,
          ),
          AuthTextField(
            textEditingController: addAddressCubit.mobileNumberController,
            keyboardType: TextInputType.text,
            validator: Validate.validatePhoneNumber,
          ),
          SizedBox(
            height: 25.h,
          ),
          const AuthFieldText(title: "Full Name*"),
          SizedBox(
            height: 6.h,
          ),
          AuthTextField(
            textEditingController: addAddressCubit.fullNameController,
            keyboardType: TextInputType.text,
            validator: Validate.validateFailed,
          ),
          SizedBox(
            height: 25.h,
          ),
          const AuthFieldText(title: "Select Area**"),
          SizedBox(
            height: 6.h,
          ),
          //! this areas
          BlocBuilder<AreaCubit, AreaState>(
            builder: (context, state) {
              return SelectedAreaDropDown(areaCubit: areaCubit);
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          const AuthFieldText(title: "Block No*"),
          SizedBox(
            height: 6.h,
          ),
          AuthTextField(
            textEditingController: addAddressCubit.blockNoController,
            keyboardType: TextInputType.text,
            validator: Validate.validateFailed,
          ),
          SizedBox(
            height: 25.h,
          ),
          const AuthFieldText(title: "Street*"),
          SizedBox(
            height: 6.h,
          ),
          AuthTextField(
            textEditingController: addAddressCubit.streetController,
            keyboardType: TextInputType.text,
            validator: Validate.validateFailed,
          ),
          SizedBox(
            height: 25.h,
          ),
          const AuthFieldText(title: "Avenue"),
          SizedBox(
            height: 6.h,
          ),
          AuthTextField(
            textEditingController: addAddressCubit.avenueController,
            keyboardType: TextInputType.text,
            validator: Validate.validateFailed,
          ),
          SizedBox(
            height: 25.h,
          ),
          const AuthFieldText(title: "Floor No*"),
          SizedBox(
            height: 6.h,
          ),
          AuthTextField(
            textEditingController: addAddressCubit.floorNoController,
            keyboardType: TextInputType.text,
            validator: Validate.validateFailed,
          ),
          SizedBox(
            height: 25.h,
          ),
          const AuthFieldText(title: "Flat No*"),
          SizedBox(
            height: 6.h,
          ),
          AuthTextField(
            textEditingController: addAddressCubit.flatNoController,
            keyboardType: TextInputType.text,
            validator: Validate.validateFailed,
          ),
          SizedBox(
            height: 25.h,
          ),
          const AuthFieldText(title: "Extra Directions*"),
          SizedBox(
            height: 6.h,
          ),
          AuthTextField(
            textEditingController: addAddressCubit.extraDirectionsController,
            keyboardType: TextInputType.text,
            validator: Validate.validateFailed,
            minLine: 4,
            maxLine: 4,
          ),
          SizedBox(
            height: 35.h,
          ),
        ],
      ),
    );
  }
}

class SelectedAreaDropDown extends StatelessWidget {
  const SelectedAreaDropDown({
    super.key,
    required this.areaCubit,
  });

  final AreaCubit areaCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385.w,
      margin: EdgeInsetsDirectional.only(end: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        border: Border.all(width: 2, color: AppColor.failedBorderColor),
      ),
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
        validator: (value) {
          if (value == null) {
            return 'Please select an area'; // Validation error message
          }
          return null; // No validation error
        },
        icon: SvgPicture.asset(
          IconsPath.dropDownIcon,
        ),
        decoration: InputDecoration(
          errorStyle: AppStyles.textStyle14.copyWith(color: Colors.red[400]),
          hintText: "enter here",
          hintStyle: AppStyles.textStyle14.copyWith(color: AppColor.silver),
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20.w,
          ),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
