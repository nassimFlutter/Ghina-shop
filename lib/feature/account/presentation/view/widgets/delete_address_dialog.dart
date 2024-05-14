import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/data/models/address_model/address_model.dart';
import 'package:best_price/feature/account/presentation/manager/address_cubit/address_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/delete_address_cubit/delete_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAddressDialog extends StatelessWidget {
  const DeleteAddressDialog({
    super.key,
    required this.deleteAddressCubit,
    required this.address,
  });

  final DeleteAddressCubit deleteAddressCubit;
  final Item address;

  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = AddressCubit.get(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(10),
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 240.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            SizedBox(
              height: 21.h,
            ),
            Text(
              "Delete Your Address",
              style: AppStyles.textStyle20w700,
            ),
            SizedBox(
              height: 12.h,
            ),
            const SizedBox(width: double.infinity, child: Divider()),
            SizedBox(
              height: 26.h,
            ),
            Text(
              "Are you sure you want to delete your address?",
              textAlign: TextAlign.center,
              style: AppStyles.textStyle17w700
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
            ),
            SizedBox(
              height: 26.h,
            ),
            BlocConsumer<DeleteAddressCubit, DeleteAddressState>(
              listener: (context, state) {
                if (state is DeleteAddressSuccess) {
                  HelperFunctions.navigateToBack(context);
                  addressCubit.getMyAddress();
                }
              },
              builder: (context, state) {
                if (state is DeleteAddressLoading) {
                  return const Center(
                    child: CustomCircularProgressIndicator(),
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 119.w,
                          height: 40.h,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.50.sp),
                                side: const BorderSide(
                                    color: AppColor.buddhaGold)),
                          ),
                          child: Center(
                            child: Text('No',
                                textAlign: TextAlign.center,
                                style: AppStyles.textStyle17w700
                                    .copyWith(color: Colors.black)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      GestureDetector(
                        onTap: () async {
                          deleteAddressCubit.deleteAddress(address.id ?? -100);
                        },
                        child: Container(
                          width: 119.w,
                          height: 40.h,
                          decoration: ShapeDecoration(
                            color: AppColor.buddhaGold,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19.50.sp),
                            ),
                          ),
                          child: Center(
                            child: Text('Yes',
                                textAlign: TextAlign.center,
                                style: AppStyles.textStyle17w700),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            SizedBox(
              height: 21.h,
            )
          ],
        ),
      ),
    );
  }
}
