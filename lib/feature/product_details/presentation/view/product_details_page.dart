import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/cart/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_network_image_widget.dart';
import '../manager/product_details_cubit/product_details_cubit.dart';
import 'widget/small_photo_option_widget_new.dart';
import 'widget/video_player_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.id});
  final int id;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
// todo : finish translate
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductDetailsCubit(widget.id),
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
                              title: "${cubit.productDetailsModel.data?.name}",
                              secondIconPath: IconsPath.buyIcon,
                              // thirdIconPath: IconsPath.favoriteIcon,
                              onSecondIconTap: () {
                                context.read<AddToCartCubit>().addToCart(
                                    cubit.productDetailsModel.data?.id
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
                              height: 250,
                              decoration: BoxDecoration(
                                color: AppColor.containerBackColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: PageView.builder(
                                  controller: pageController,
                                  itemCount: cubit.productDetailsModel.data
                                          ?.images?.length ??
                                      0,
                                  onPageChanged: (index) {
                                    cubit.onChangeIndexImages(index);
                                  },
                                  itemBuilder: (context, index) {
                                    final media = cubit.productDetailsModel.data
                                        ?.images?[index];
                                    final isVideo = media?.type == 11;

                                    if (isVideo) {
                                      return VideoPlayerWidget(
                                        videoUrl: media?.image ?? '',
                                      );
                                    } else {
                                      return CustomNetworkImageWidget(
                                        height: double.infinity,
                                        width: double.infinity,
                                        urlImage: media?.image ?? '',
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 6,
                          ),
                          // ignore: prefer_is_empty
                          if (cubit.productDetailsModel.data?.image?.length !=
                                  0 &&
                              cubit.productDetailsModel.data?.image?.length !=
                                  null)
                            Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    for (int i = 0;
                                        i <
                                            cubit.productDetailsModel.data!
                                                .images!.length;
                                        i++)
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              cubit.onChangeIndexImages(i);
                                              pageController.animateToPage(
                                                i,
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                curve: Curves.easeInOut,
                                              );
                                            },
                                            child: SmallPhotoOptionWidget(
                                              borderColor:
                                                  i == cubit.indexImagesDetails
                                                      ? AppColor.pirateGold
                                                      : AppColor.borderColor,
                                              imageUrl: cubit
                                                      .productDetailsModel
                                                      .data
                                                      ?.images?[i]
                                                      .image ??
                                                  '',
                                              isVideo: cubit.productDetailsModel
                                                      .data?.images?[i].type ==
                                                  11,
                                            ),
                                          ),
                                          const SizedBox(width: 14),
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
                                  "${cubit.productDetailsModel.data?.name}",
                                  style: AppStyles.textStyle24w700,
                                ),
                                // Text(
                                //   "${S.of(context).by} ${cubit.productDetailsModel.data?.companyName}",
                                //   style: AppStyles.textStyle16w700.copyWith(
                                //     color: AppColor.black2,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "قيّم المنتج", // Rate the product
                                  style: AppStyles.textStyle18w700,
                                ),
                                SizedBox(height: 8.h),
                                RatingBar.builder(
                                  initialRating: 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  unratedColor: Colors.grey.shade300,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                SizedBox(height: 12.h),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.buddhaGold),
                                  onPressed: () {
                                    showTopSnackBar(
                                      Overlay.of(context),
                                      const CustomSnackBar.success(
                                        message: "تم إرسال تقييمك بنجاح!",
                                        backgroundColor: AppColor.green,
                                      ),
                                    );
                                  },
                                  child: Text("إرسال التقييم",
                                      style: TextStyle(fontSize: 14.sp)),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 16.h,
                          ),

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
                                  "${cubit.productDetailsModel.data?.description?.replaceAll(RegExp(r'<[^>]*>'), '')}",
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
                                                    .data?.discountPrice !=
                                                null,
                                            child: Text(
                                              '${cubit.productDetailsModel.data?.discountPrice} ل.س',
                                              style: AppStyles.textStyle20w700
                                                  .copyWith(
                                                color: AppColor.redOpacity,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${cubit.productDetailsModel.data?.price} ل.س',
                                            style: AppStyles.textStyle14w700
                                                .copyWith(
                                              decoration: cubit
                                                          .productDetailsModel
                                                          .data
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
                                                  cubit.productDetailsModel.data
                                                          ?.id
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
