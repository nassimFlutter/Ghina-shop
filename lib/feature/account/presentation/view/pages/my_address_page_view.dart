import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/core/widgets/not_found_widget.dart';
import 'package:best_price/feature/account/data/models/address_model/address_model.dart';
import 'package:best_price/feature/account/presentation/manager/address_cubit/address_cubit.dart';
import 'package:best_price/feature/account/presentation/view/pages/add_address_page_view.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/address_item.dart';

class MyAddressView extends StatelessWidget {
  const MyAddressView({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = AddressCubit.get(context);
    addressCubit.getMyAddress();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: AppBarRow(
              iconPath: IconsPath.arrowLeftIcon,
              title: S.of(context).my_addresses, //' My Addresses',
            ),
          ),
          SizedBox(
            height: 44.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppBottom(
              title: S.of(context).add_new_address, //"Add New Address",
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
                        itemBuilder: (context, index) {
                          return AddressItem(
                            address: addressCubit.myAddress.items?[index] ??
                                Item(type: 1),
                          );
                        },
                      ),
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
