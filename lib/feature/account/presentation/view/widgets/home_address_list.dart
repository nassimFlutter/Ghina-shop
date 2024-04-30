import 'package:best_price/feature/account/presentation/manager/add_address/add_address_cubit.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAddressList extends StatelessWidget {
  const HomeAddressList({
    super.key,
  });
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    AddAddressCubit addAddressCubit = AddAddressCubit.get(context);

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        AuthFieldText(
          title: S.of(context).address_title_, //"Address Title*",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.addressTitleController,
          keyboardType: TextInputType.streetAddress,
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
          keyboardType: TextInputType.phone,
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
        AuthTextField(
          textEditingController: addAddressCubit.addressTitleController,
          keyboardType: TextInputType.streetAddress,
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
          keyboardType: TextInputType.streetAddress,
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
          keyboardType: TextInputType.streetAddress,
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(
          title: S.of(context).house_no, //"house No",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.houseNoController,
          keyboardType: TextInputType.streetAddress,
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(
          title: S.of(context).extra_directions_, //"Extra Directions*",
        ),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.extraDirectionsController,
          keyboardType: TextInputType.multiline,
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
