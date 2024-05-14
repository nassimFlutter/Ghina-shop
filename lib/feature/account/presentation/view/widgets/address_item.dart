import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/data/models/address_model/address_model.dart';
import 'package:best_price/feature/account/presentation/manager/add_address/add_address_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/address_cubit/address_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/change_address_page/change_address_page_cubit.dart';
import 'package:best_price/feature/account/presentation/manager/delete_address_cubit/delete_address_cubit.dart';
import 'package:best_price/feature/account/presentation/view/pages/add_address_page_view.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'delete_address_dialog.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.address,
  });
  final Item address;
  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = AddressCubit.get(context);
    DeleteAddressCubit deleteAddressCubit = DeleteAddressCubit.get(context);
    ChangeAddressPageCubit changeAddressPageCubit =
        ChangeAddressPageCubit.get(context);
    AddAddressCubit addAddressCubit = AddAddressCubit.get(context);
    return Container(
      width: 361.w,
      margin: EdgeInsetsDirectional.only(bottom: 20.h, start: 16.w, end: 16.w),
      padding: EdgeInsetsDirectional.only(start: 12.w),
      decoration: ShapeDecoration(
        color: AppColor.containerBackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 19.h,
          ),
          Text(addressCubit.typeUi[address.type ?? 0],
              style: AppStyles.textStyle18w700),
          SizedBox(
            height: 12.h,
          ),
          ExpandableText(
            '${address.addressName}, ${address.street}, ${address.floorNumber}, ${address.area?.name ?? ""}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.w400,
            ),
            expandText: S.of(context).show_more, //'show more',
            collapseText: S.of(context).show_less, //'show less',
            maxLines: 4,
            linkColor: AppColor.silver, // optional
          ),
          SizedBox(
            height: 12.h,
          ),
          BlocBuilder<DeleteAddressCubit, DeleteAddressState>(
              builder: (context, state) {
            return Padding(
              padding: EdgeInsetsDirectional.only(end: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        HelperFunctions.showCustomDialog(
                            context,
                            DeleteAddressDialog(
                                deleteAddressCubit: deleteAddressCubit,
                                address: address));
                      },
                      child: SvgPicture.asset(IconsPath.deleteIcon)),
                  SizedBox(
                    width: 25.w,
                  ),
                  InkWell(
                      onTap: () {
                        LoggerHelper.error(address.type.toString());
                        if (address.type == 0) {
                          changeAddressPageCubit.selectedIndex = 0;
                        } else if (address.type == 1) {
                          changeAddressPageCubit.selectedIndex = 1;
                        } else if (address.type == 2) {
                          changeAddressPageCubit.selectedIndex = 2;
                        }
                        // addAddressCubit.addressTitleController.text =
                        //     address.addressName ?? "";
                        // addAddressCubit.blockNoController.text =
                        //     address.block ?? "";
                        // addAddressCubit.streetController.text =
                        //     address.street ?? "";
                        // addAddressCubit.avenueController.text =
                        //     address.avenue ?? "";
                        // addAddressCubit.floorNoController.text =
                        //     address.floorNumber ?? "";
                        // addAddressCubit.flatNoController.text =
                        //     address.floorNumber;
                        // addAddressCubit.extraDirectionsController.text =
                        //     address.notes ?? "";
                        HelperFunctions.navigateToScreen(
                            context, const AddAddressView());
                      },
                      child: SvgPicture.asset(IconsPath.editAccountIcon)),
                ],
              ),
            );
          }),
          SizedBox(
            height: 14.h,
          ),
        ],
      ),
    );
  }
}
