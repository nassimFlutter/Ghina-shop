import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/not_found_widget.dart';
import 'package:best_price/feature/account/data/models/address_model/address_model.dart';
import 'package:best_price/feature/account/presentation/manager/address_cubit/address_cubit.dart';
import 'package:best_price/feature/account/presentation/view/pages/add_address_page_view.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAddressView extends StatelessWidget {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = AddressCubit.get(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: const AppBarRow(
                iconPath: IconsPath.arrowLeftIcon, title: ' My Addresses'),
          ),
          SizedBox(
            height: 44.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppBottom(
              title: "Add New Address",
              onTap: () {
                HelperFunctions.navigateToScreen(
                    context, const AddAddressView());
              },
            ),
          ),
          SizedBox(
            height: 104.h,
          ),
          BlocConsumer<AddressCubit, AddressState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is AddressLoading) {
                return const Center(
                  child: CustomCircularProgressIndicator(),
                );
              }
              //! if state is not Loading or Failures
              else {
                //! if myAddress.item !=null
                if (addressCubit.myAddress.items != null) {
                  if (addressCubit.myAddress.items!.isEmpty) {
                    return const NotFoundWidget();
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: addressCubit.myAddress.items?.length ?? 0,
                          itemBuilder: (context, index) => AddressItem(
                                address: addressCubit.myAddress.items?[index] ??
                                    Item(),
                              )),
                    );
                  }
                } else {
                  return const SizedBox();
                }
              }
            },
          )
        ],
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.address,
  });
  final Item address;
  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = AddressCubit.get(context);

    return Container(
      width: 361.w,
      margin: EdgeInsetsDirectional.only(bottom: 20.h, start: 16.w, end: 16.w),
      padding: EdgeInsetsDirectional.only(start: 12.w),
      decoration: ShapeDecoration(
        color: AppColor.containerBackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
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
            expandText: 'show more',
            collapseText: 'show less',
            maxLines: 4,
            linkColor: AppColor.silver, // optional
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(IconsPath.deleteIcon),
                SizedBox(
                  width: 25.w,
                ),
                SvgPicture.asset(IconsPath.editAccountIcon),
              ],
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
        ],
      ),
    );
  }
}
