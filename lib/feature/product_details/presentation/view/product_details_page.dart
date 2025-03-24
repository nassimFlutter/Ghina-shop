import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/cart/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:best_price/feature/product_details/presentation/view/widget/small_photo_option_widget.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import '../../../../core/widgets/custom_network_image_widget.dart';
import '../manager/product_details_cubit/product_details_cubit.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.id});
  final int id;
// todo : finish translate

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductDetailsCubit(id),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
          listener: (BuildContext context, ProductDetailsState state) {},
          builder: (BuildContext context, ProductDetailsState state) {
            ProductDetailsCubit cubit = ProductDetailsCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              body: state is ProductDetailsCubitLoading
                  ? Container(
                      // padding: EdgeInsets.only(top: 100),
                      alignment: Alignment.center,
                      child: const CustomLoading(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                              top: 14,
                              start: 16.w,
                              end: 16.w,
                            ),
                            child: AppBarRow(
                              title: "${cubit.productDetailsModel.items?.name}",
                              secondIconPath: IconsPath.buyIcon,
                              // thirdIconPath: IconsPath.favoriteIcon,
                              onSecondIconTap: () {
                                context.read<AddToCartCubit>().addToCart(
                                    cubit.productDetailsModel.items?.id
                                            .toString() ??
                                        "",
                                    cubit.quantity);
                              },
                              onThirdIconTap: () {},
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 16.w),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.containerBackColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: CustomNetworkImageWidget(
                                    urlImage:
                                        "${cubit.productDetailsModel.items?.image}",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          // ignore: prefer_is_empty
                          if (cubit.productDetailsModel.items?.image?.length !=
                                  0 &&
                              cubit.productDetailsModel.items?.image?.length !=
                                  null)
                            Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    for (int i = 0;
                                        i <
                                            cubit.productDetailsModel.items!
                                                .images!.length;
                                        i++)
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              cubit.onChangeIndexImages(i);
                                            },
                                            child: SmallPhotoOptionWidget(
                                                borderColor: i ==
                                                        cubit.indexImagesDetails
                                                    ? AppColor.pirateGold
                                                    : AppColor.borderColor,
                                                imageUrl:
                                                    "${cubit.productDetailsModel.items?.images?[i].image}"),
                                          ),
                                          const SizedBox(
                                            width: 14,
                                          ),
                                        ],
                                      ),

                                    // SmallPhotoOptionWidget(
                                    //   borderColor: AppColor.pirateGold,
                                    //   imageUrl:
                                    //       "https://s3-alpha-sig.figma.com/img/ffc0/0893/6bf5b2910d3a8bfa3aa7420eedc796f8?Expires=1714953600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JUIGWgh27H1sjWc5Kx9eq0Hxs2o56bqbj2of~EwqY8EnxrXmh7u5J4o2IUyYk3g3OrY~LLaj0e~gablv43hKbJeOU7KOFqRSvl4Aum-v-JQQqGAWY8ht2YQruAU8GpXBSJgLggPE4bKjix0cSw9Fpxaz5RE335kMC99iRLL1PdA63BCa1tbXZ6u0xATOI2VDO93TLAW1W0kLuKEm~cqtAvgSd5weXxc5EqmAW70DeG3ypD2BQM8tbo7-bFwWAVZog07p2Ni6x3hJJ1jSCZeNqwvMt00GULrlHN~6l~xsILSYnLoUZogssjHPvXXxILkyXTsR4otJ7ZCkutq~On4-5w__",
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 14,
                          ),
                          //? product and company name section
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${cubit.productDetailsModel.items?.name}",
                                  style: AppStyles.textStyle24w700,
                                ),
                                // Text(
                                //   "${S.of(context).by} ${cubit.productDetailsModel.items?.companyName}",
                                //   style: AppStyles.textStyle16w700.copyWith(
                                //     color: AppColor.black2,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          //? ------------------------
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                          //   child: Text(
                          //     S.of(context).size, //  "Size",
                          //     style: AppStyles.textStyle18w700,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 16.w, vertical: 10.h),
                          //   child: SizedBox(
                          //     height: 50.h,
                          //     child: ListView.builder(
                          //       itemCount: cubit.productDetailsModel.items
                          //           ?.variants?.length,
                          //       scrollDirection: Axis.horizontal,
                          //       itemBuilder: (context, index) {
                          //         bool isPress = cubit.productDetailsModel.items
                          //                 ?.variants?[index].size?.id ==
                          //             cubit.sizeId;

                          //         return GestureDetector(
                          //           onTap: () {
                          //             if (cubit.colorId == 0) {
                          //               cubit.setSize(cubit
                          //                       .productDetailsModel
                          //                       .items
                          //                       ?.variants?[index]
                          //                       .size
                          //                       ?.id ??
                          //                   0);
                          //             } else {
                          //               if (cubit.checkIfSizeAndColorExist(
                          //                   cubit.sizeId,
                          //                   cubit.colorId,
                          //                   cubit.productDetailsModel.items
                          //                       ?.variants)) {
                          //                 cubit.setSize(cubit
                          //                         .productDetailsModel
                          //                         .items
                          //                         ?.variants?[index]
                          //                         .size
                          //                         ?.id ??
                          //                     0);
                          //               } else {}
                          //             }
                          //           },
                          //           child: Container(
                          //             decoration: BoxDecoration(
                          //               borderRadius: const BorderRadius.all(
                          //                   Radius.circular(10)),
                          //               color: cubit.checkIfSizeAndColorExist(
                          //                       cubit.sizeId,
                          //                       cubit.colorId,
                          //                       cubit.productDetailsModel.items
                          //                           ?.variants)
                          //                   ? (isPress
                          //                       ? AppColor.yalow
                          //                       : AppColor.backColorSize)
                          //                   : AppColor.gray,
                          //             ),
                          //             width: 100.w,
                          //             height: 50.h,
                          //             child: Center(
                          //               child: Text(
                          //                 "${cubit.productDetailsModel.items?.variants?[index].size?.name}",
                          //                 style: AppStyles.textStyle14,
                          //               ),
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),

                          // SizedBox(
                          //   height: 16.h,
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                          //   child: Text(
                          //     S.of(context).color, // "Color",
                          //     style: AppStyles.textStyle18w700,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 16.w, vertical: 10.h),
                          //   child: SizedBox(
                          //     height: 50.h,
                          //     child: ListView.builder(
                          //       itemCount: cubit.productDetailsModel.items
                          //           ?.variants?.length,
                          //       scrollDirection: Axis.horizontal,
                          //       itemBuilder: (context, index) {
                          //         // print(cubit.productDetailsModel.items
                          //         //     ?.variants?[index].quantity);
                          //         bool isPress = cubit.productDetailsModel.items
                          //                 ?.variants?[index].color?.id ==
                          //             cubit.colorId;
                          //         return GestureDetector(
                          //           onTap: () {
                          //             if (cubit.sizeId == 0) {
                          //               cubit.setColor(cubit
                          //                       .productDetailsModel
                          //                       .items
                          //                       ?.variants?[index]
                          //                       .color
                          //                       ?.id ??
                          //                   0);
                          //             } else {
                          //               if (cubit.checkIfSizeAndColorExist(
                          //                   cubit.sizeId,
                          //                   cubit.colorId,
                          //                   cubit.productDetailsModel.items
                          //                       ?.variants)) {
                          //                 cubit.setColor(cubit
                          //                         .productDetailsModel
                          //                         .items
                          //                         ?.variants?[index]
                          //                         .color
                          //                         ?.id ??
                          //                     0);
                          //               } else {}
                          //             }
                          //           },
                          //           child: Container(
                          //             decoration: BoxDecoration(
                          //               borderRadius: const BorderRadius.all(
                          //                 Radius.circular(10),
                          //               ),
                          //               color: cubit.checkIfSizeAndColorExist(
                          //                       cubit.sizeId,
                          //                       cubit.colorId,
                          //                       cubit.productDetailsModel.items
                          //                           ?.variants)
                          //                   ? (isPress
                          //                       ? AppColor.yalow
                          //                       : AppColor.backColorSize)
                          //                   : AppColor.gray,
                          //             ),
                          //             width: 100.w,
                          //             height: 50.h,
                          //             child: Center(
                          //               child: Text(
                          //                 "${cubit.productDetailsModel.items?.variants?[index].color?.name}",
                          //                 style: AppStyles.textStyle16,
                          //               ),
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),

                          SizedBox(
                            height: 16.h,
                          ),
                          //? description section
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).description, //   "Description",
                                  style: AppStyles.textStyle18w700,
                                ),
                                Text(
                                  "${cubit.productDetailsModel.items?.description?.replaceAll(RegExp(r'<[^>]*>'), '')}",
                                  style: AppStyles.textStyle16w400.copyWith(
                                    color: AppColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //? ------------------------
                          const SizedBox(
                            height: 32,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsetsDirectional.only(
                              top: 20,
                              start: 16,
                              end: 16,
                              bottom: 36.h,
                            ),
                            decoration: const BoxDecoration(
                                color: AppColor.secondGreyColor),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Visibility(
                                            visible: cubit.productDetailsModel
                                                    .items?.discountPrice !=
                                                null,
                                            child: Text(
                                              '${cubit.productDetailsModel.items?.discountPrice} ل.س',
                                              style: AppStyles.textStyle20w700
                                                  .copyWith(
                                                color: AppColor.redOpacity,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${cubit.productDetailsModel.items?.price} ل.س',
                                            style: AppStyles.textStyle14w700
                                                .copyWith(
                                              decoration: cubit
                                                          .productDetailsModel
                                                          .items
                                                          ?.discountPrice !=
                                                      null
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                              decorationColor:
                                                  AppColor.greyText,
                                              color: AppColor.greyText,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              cubit.plusQuantity();
                                            },
                                            child: Container(
                                              height: 34,
                                              width: 34,
                                              color: Colors.amber,
                                              child: const Center(
                                                  child: Icon(
                                                size: 17,
                                                Icons.add,
                                                color: Colors.black,
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            cubit.quantity.toString(),
                                            style: AppStyles.textStyle18w700,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // print("object");
                                              cubit.minQuantity();
                                            },
                                            child: Container(
                                              height: 34,
                                              width: 34,
                                              color: AppColor.greyText,
                                              child: Center(
                                                  child: Text('-',
                                                      style: AppStyles
                                                          .textStyle24)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                BlocConsumer<AddToCartCubit, AddToCartState>(
                                  listener: (context, state) {
                                    if (state is AddToCartSuccess) {
                                      showTopSnackBar(
                                        Overlay.of(context),
                                        CustomSnackBar.success(
                                          message:
                                              "تمت إضافة العنصر إلى سلة التسوق بنجاح!",
                                          backgroundColor: AppColor.green,
                                          textStyle: AppStyles.textStyle14.copyWith(
                                              color: AppColor.whiteColorOpacity,
                                              fontWeight: FontWeight
                                                  .w700), // Custom color if needed
                                        ),
                                      );
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is AddToCartLoading) {
                                      return const Center(
                                          child: CustomLoading());
                                    } else {
                                      return AppBottom(
                                        onTap: () {
                                          context
                                              .read<AddToCartCubit>()
                                              .addToCart(
                                                  cubit.productDetailsModel
                                                          .items?.id
                                                          .toString() ??
                                                      "",
                                                  cubit.quantity);
                                        },
                                        title: S
                                            .of(context)
                                            .add_to_cart, //"Add to Cart",
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCircle(
      size: 30,
      color: AppColor.pirateGold,
    );
  }
}
