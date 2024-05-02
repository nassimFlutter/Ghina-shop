import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/presentation/manager/address_cubit/address_cubit.dart';
import 'package:best_price/feature/account/presentation/view/pages/add_address_page_view.dart';
import 'package:best_price/feature/cheack_out/presntation/manager/selected_address_cubit/selected_address_cubit.dart';
import 'package:best_price/feature/cheack_out/presntation/view/pages/checkout_success.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../account/data/models/address_model/address_model.dart';
import '../widgets/code_failed.dart';
import '../widgets/item_payment_method.dart';
import '../widgets/payment_details_container.dart';
import '../widgets/title_check_page.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CheckoutBody(),
    );
  }
}

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = AddressCubit.get(context);
    SelectedAddressCubit selectedAddressCubit =
        SelectedAddressCubit.get(context);
    addressCubit.getMyAddress();
    return ListView(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: Dimensions.dStartPadding.w),
      children: [
        SizedBox(
          height: 15.h,
        ),
        AppBarRow(
          iconPath: IconsPath.arrowLeftIcon,
          title: "Checkout",
          onFirstIconTap: () {
            HelperFunctions.navigateToBack(context);
            selectedAddressCubit.initSelected();
          },
        ),
        SizedBox(
          height: 32.h,
        ),
        const TitleCheckPage(title: "Address"),
        SizedBox(
          height: 14.h,
        ),
        BlocBuilder<SelectedAddressCubit, SelectedAddressState>(
          builder: (context, state) {
            if (state is SelectedAddressSuccess) {
              return AddressItem(
                addressCubit: addressCubit,
                addressItem: selectedAddressCubit.addressSelected,
              );
            }
            return Container(
              height: 97.49.h,
              decoration: ShapeDecoration(
                color: AppColor.greyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      isScrollControlled: true,
                      clipBehavior: Clip.none,
                      builder: (context) {
                        return BlocConsumer<AddressCubit, AddressState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is AddressSuccess) {
                              return AddressBottomSheet(
                                addressModel: addressCubit.myAddress,
                              );
                            } else if (state is AddressLoading) {
                              return const Center(
                                child: CustomCircularProgressIndicator(),
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        );
                      },
                    );
                  },
                  child: Text(
                    "Add address",
                    style: AppStyles.textStyle16w700.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 32.h,
        ),
        const TitleCheckPage(
          title: "Coupon Code",
        ),
        SizedBox(
          height: 14.h,
        ),
        const CodeFailed(),
        SizedBox(
          height: 45.h,
        ),
        const TitleCheckPage(
          title: "Payment Methode",
        ),
        SizedBox(
          height: 14.h,
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ItemPaymentMethod(
                  currentValue: 100,
                  title: "",
                  iconPath: IconsPath.aboutIcon,
                  onChange: (value) {},
                  value: 100);
            },
            separatorBuilder: (context, index) => SizedBox(),
            itemCount: 4),
        SizedBox(
          height: 30.h,
        ),
        const TitleCheckPage(
          title: "Payment Details",
        ),
        SizedBox(
          height: 14.h,
        ),
        const PaymentDetailsContainer(),
        SizedBox(
          height: 40.h,
        ),
        AppBottom(
          title: "Proceed to Pay",
          onTap: () {
            HelperFunctions.navigateToScreen(context, const CheckOutSuccess());
          },
        ),
        SizedBox(
          height: 26.h,
        ),
      ],
    );
  }
}

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.addressCubit,
    required this.addressItem,
  });

  final AddressCubit addressCubit;
  final Item addressItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      margin: EdgeInsetsDirectional.only(bottom: 20.h),
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
          Text(addressCubit.typeUi[addressItem.type ?? 0],
              style: AppStyles.textStyle18w700),
          SizedBox(
            height: 12.h,
          ),
          ExpandableText(
            '${addressItem.addressName}, ${addressItem.street}, ${addressItem.floorNumber}, ${addressItem.area?.name ?? ""}',
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
            height: 16.h,
          ),
          Text(
            "+965 87888788",
            style: AppStyles.textStyle16w400.copyWith(color: AppColor.black),
          ),
          SizedBox(
            height: 12.h,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                isScrollControlled: true,
                clipBehavior: Clip.none,
                builder: (context) {
                  return BlocConsumer<AddressCubit, AddressState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is AddressSuccess) {
                        return AddressBottomSheet(
                          addressModel: addressCubit.myAddress,
                        );
                      } else if (state is AddressLoading) {
                        return const Center(
                          child: CustomCircularProgressIndicator(),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  );
                },
              );
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(IconsPath.editAccountIcon),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Edit Address",
                    style: AppStyles.textStyle14w400
                        .copyWith(color: AppColor.black),
                  ),
                ],
              ),
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

class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({
    super.key,
    required this.addressModel,
  });
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = AddressCubit.get(context);
    SelectedAddressCubit selectedAddressCubit =
        SelectedAddressCubit.get(context);

    return Container(
      clipBehavior: Clip.none,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          color: Colors.white),
      height: 506.h,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45.h,
              ),
              Text(
                "Select Address",
                style: AppStyles.textStyle18w700
                    .copyWith(color: AppColor.greyText),
              ),
              SizedBox(
                height: 37.h,
              ),
              ListView.builder(
                  itemCount: addressModel.items?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var address = addressModel.items?[index];
                    return Container(
                      width: 361.w,
                      margin: EdgeInsetsDirectional.only(bottom: 12.h),
                      padding: EdgeInsetsDirectional.only(start: 12.w),
                      decoration: ShapeDecoration(
                        color: AppColor.containerBackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 19.h,
                                ),
                                Text(
                                    addressCubit.typeUi[
                                        addressModel.items?[index].type ?? 0],
                                    style: AppStyles.textStyle18w700),
                                SizedBox(
                                  height: 12.h,
                                ),
                                ExpandableText(
                                  '${address?.addressName}, ${address?.street}, ${address?.floorNumber}, ${address?.area?.name ?? ""}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontFamily: 'Josefin Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  expandText: 'show more',
                                  collapseText: 'show less',
                                  maxLines: 4,
                                  linkColor: AppColor.silver,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text("+965 87888788",
                                    style: AppStyles.textStyle18w700),
                                SizedBox(
                                  height: 28.h,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(top: 16.h),
                            child: BlocConsumer<SelectedAddressCubit,
                                SelectedAddressState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return Radio(
                                  value: index,
                                  groupValue:
                                      selectedAddressCubit.selectedIndex,
                                  onChanged: (value) {
                                    context
                                        .read<SelectedAddressCubit>()
                                        .selectAddress(index);
                                    selectedAddressCubit.addressSelected =
                                        addressModel.items?[selectedAddressCubit
                                                .selectedIndex] ??
                                            Item();
                                  },
                                  activeColor: AppColor.black,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 17.h,
              ),
              AppBottom(
                title: "Add New Address",
                onTap: () {
                  HelperFunctions.navigateToScreen(
                      context, const AddAddressView());
                },
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
