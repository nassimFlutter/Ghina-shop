import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/product_details/presentation/view/widget/small_photo_option_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/widgets/custom_network_image_widget.dart';
import '../manager/product_details_cubit/product_details_cubit.dart';

class ProductDetailsPage extends StatelessWidget {
  final int id;
  const ProductDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductDetailsCubit(id),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
          listener: (BuildContext context, ProductDetailsState state) {},
          builder: (BuildContext context, ProductDetailsState state) {
            ProductDetailsCubit cubit = ProductDetailsCubit.get(context);
            return Scaffold(
              body: state is ProductDetailsCubitLoading
                  ? Container(
                      // padding: EdgeInsets.only(top: 100),
                      alignment: Alignment.center,
                      child: const SpinKitFadingCircle(
                        size: 30,
                        color: AppColor.pirateGold,
                      ))
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
                              thirdIconPath: IconsPath.favoriteIcon,
                              onSecondIconTap: () {},
                              onThirdIconTap: () {},
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 16.w),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.containerBackColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: CustomNetworkImageWidget(
                                      urlImage:
                                          "${cubit.productDetailsModel.items?.image}",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
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
                                Text(
                                  "by ${cubit.productDetailsModel.items?.companyName}",
                                  style: AppStyles.textStyle16w700.copyWith(
                                    color: AppColor.black2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //? ------------------------
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
                                  "Description",
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
                          SizedBox(
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
                                          Text(
                                            '${cubit.productDetailsModel.items?.discountPrice} KD',
                                            style: AppStyles.textStyle20w700
                                                .copyWith(
                                              color: AppColor.redOpacity,
                                            ),
                                          ),
                                          Text(
                                            '${cubit.productDetailsModel.items?.price} KD',
                                            style: AppStyles.textStyle14w700
                                                .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor:
                                                  AppColor.greyText,
                                              color: AppColor.greyText,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 34,
                                            width: 34,
                                            color: Colors.amber,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                AppBottom(
                                  title: "title",
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
