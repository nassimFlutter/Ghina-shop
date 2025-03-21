import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/presentation/manager/add_address/add_address_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/change_address_page/change_address_page_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/accommodat_list.dart';
import '../widgets/apartment_address_list.dart';
import '../widgets/home_address_list.dart';
import '../widgets/office_address_list.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeAddressPageCubit changeAddressPageCubit =
        ChangeAddressPageCubit.get(context);
    AddAddressCubit addAddressCubit = AddAddressCubit.get(context);
    return Scaffold(
      body: Form(
        key: addAddressCubit.formKey,
        child: ListView(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          children: [
            SizedBox(
              height: 14.h,
            ),
            const AppBarRow(
                iconPath: IconsPath.arrowLeftIcon, title: ' My Addresses'),
            SizedBox(
              height: 41.h,
            ),
            Text(
              'Accommodation Type',
              style: AppStyles.textStyle14,
            ),
            SizedBox(
              height: 14.h,
            ),
            SizedBox(
              height: 40.h,
              child: const AccommodatList(),
            ),
            SizedBox(
              height: 35.h,
            ),
            BlocBuilder<ChangeAddressPageCubit, ChangeAddressPageState>(
              builder: (context, state) {
                if (changeAddressPageCubit.selectedIndex == 0) {
                  return const ApartmentAddressList();
                } else if (changeAddressPageCubit.selectedIndex == 1) {
                  return const HomeAddressList();
                } else {
                  return const OfficeAddressList();
                }
              },
            ),
            BlocConsumer<AddAddressCubit, AddAddressState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is AddAddressLoading) {
                  return const Center(
                    child: CustomCircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(end: 16.w),
                    child: AppBottom(
                      onTap: () async {
                        await addAddressCubit.addAddress(context);
                      },
                      title: S.of(context).add_address, //"Add Address",
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 26.h,
            ),
          ],
        ),
      ),
    );
  }
}
