import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/validate.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/data/models/area_model/area_model.dart';
import 'package:best_price/feature/account/presentation/manager/add_address/add_address_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/area_cubit/area_cubit.dart';
import 'package:best_price/feature/account/presentation/view/widgets/drop_down.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'selected_area_drop_down.dart';

class ApartmentAddressList extends StatelessWidget {
  const ApartmentAddressList({
    super.key,
  });
// todo : finish translate

  @override
  Widget build(BuildContext context) {
    AddAddressCubit addAddressCubit = AddAddressCubit.get(context);
    AreaCubit areaCubit = AreaCubit.get(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        AuthFieldText(
          title: S.of(context).address_title_, //"Address Title*",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.addressTitleController,
          keyboardType: TextInputType.text,
          validator: (p0) {
            return Validate.validateFailed(context, p0);
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(
          title: S.of(context).mobile_no_, //"Mobile No*",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.mobileNumberController,
          keyboardType: TextInputType.text,
          validator: (p0) {
            return Validate.validatePhoneNumber(context, p0);
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(
          title: S.of(context).full_name_, //"Full Name*",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.fullNameController,
          keyboardType: TextInputType.text,
          validator: (p0) {
            return Validate.validateFailed(context, p0);
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(
          title: S.of(context).select_area_, //"Select Area*",
        ),
        SizedBox(
          height: 6.h,
        ),
        //! this areas
        BlocBuilder<AreaCubit, AreaState>(
          builder: (context, state) {
            return SelectedAreaDropDown(
              areaCubit: areaCubit,
              validator: (p0) {
                return Validate.validateFailed(context, p0?.name);
              },
            );
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(
          title: S.of(context).block_no_, //"Block No*",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.blockNoController,
          keyboardType: TextInputType.text,
          validator: (p0) {
            return Validate.validateFailed(context, p0);
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(
          title: S.of(context).street_, //"Street*",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.streetController,
          keyboardType: TextInputType.text,
          validator: (p0) {
            return Validate.validateFailed(context, p0);
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(
          title: S.of(context).avenue, //"Avenue",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.avenueController,
          keyboardType: TextInputType.text,
          validator: (p0) {
            return Validate.validateFailed(context, p0);
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(
          title: S.of(context).floor_no_, //"Floor No*",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.floorNoController,
          keyboardType: TextInputType.text,
          validator: (p0) {
            return Validate.validateFailed(context, p0);
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(
          title: S.of(context).flat_no_, //"Flat No*",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.flatNoController,
          keyboardType: TextInputType.text,
          validator: (p0) {
            return Validate.validateFailed(context, p0);
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(
          title: S.of(context).extra_directions_, // "Extra Directions*",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.extraDirectionsController,
          keyboardType: TextInputType.text,
          validator: (p0) {
            return Validate.validateFailed(context, p0);
          },
          minLine: 4,
          maxLine: 4,
        ),
        SizedBox(
          height: 35.h,
        ),
      
      ],
    );
  }
}
