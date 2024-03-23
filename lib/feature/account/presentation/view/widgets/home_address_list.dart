import 'package:best_price/feature/account/presentation/manager/add_address/add_address_cubit.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAddressList extends StatelessWidget {
  const HomeAddressList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddAddressCubit addAddressCubit = AddAddressCubit.get(context);

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        AuthFieldText(title: "Address Title*"),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.addressTitleController,
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(title: "Mobile No*"),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.mobileNumberController,
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(title: "Full Name*"),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.fullNameController,
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(title: "Select Area**"),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.addressTitleController,
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(title: "Block No*"),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.blockNoController,
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(title: "Street*"),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.streetController,
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(title: "houseNo"),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.houseNoController,
        ),
        SizedBox(
          height: 25.h,
        ),
        AuthFieldText(title: "Extra Directions*"),
        SizedBox(
          height: 6.h,
        ),
        AuthTextField(
          textEditingController: addAddressCubit.extraDirectionsController,
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
