// import 'package:best_price/core/theme/app_color.dart';
// import 'package:best_price/core/theme/app_style.dart';
// import 'package:best_price/core/widgets/app_bar_row.dart';
// import 'package:best_price/core/widgets/circular_progress_indicator.dart';
// import 'package:best_price/feature/account/presentation/manager/order_details_cubit/order_details_cubit.dart';
// import 'package:best_price/feature/cart/presentation/widgets/intermittent_divider.dart';
// import 'package:best_price/feature/cheack_out/presntation/view/widgets/text_in_payment_details_container.dart';
// import 'package:best_price/feature/cheack_out/presntation/view/widgets/title_check_page.dart';
// import 'package:best_price/generated/l10n.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:expandable_text/expandable_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../cheack_out/presntation/view/widgets/order_details_container.dart';

// class OrderDetails extends StatefulWidget {
//   const OrderDetails({super.key, required this.orderId});
//   final int orderId;

//   @override
//   State<OrderDetails> createState() => _OrderDetailsState();
// }

// class _OrderDetailsState extends State<OrderDetails> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<OrderDetailsCubit>(context).getOrderDetails(widget.orderId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     OrderDetailsCubit orderDetailsCubit = OrderDetailsCubit.get(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           if (state is OrderDetailsLoading) {
//             return const Center(
//               child: CustomCircularProgressIndicator(),
//             );
//           } else {
//             return ListView(
//               padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
//               children: [
//                 SizedBox(height: 14.h),
//                 AppBarRow(
//                   title: S.of(context).my_orders,
//                 ),
//                 SizedBox(height: 51.h),
//                 TitleCheckPage(
//                   title: S.of(context)OrderDetailsContainer.order_details,
//                 ),
//                 SizedBox(height: 14.h),
//                 OrderDetailsContainer(
//                   orderId: orderDetailsCubit.orderDetailsModel.item?.item?.id
//                           .toString() ??
//                       '-100',
//                   orderStatue: orderDetailsCubit
//                           .orderDetailsModel.item?.item?.statusName ??
//                       "",
//                   orderDate: orderDetailsCubit
//                           .orderDetailsModel.item?.item?.orderedDate ??
//                       " ",
//                 ),
//                 SizedBox(height: 30.h),
//                 TitleCheckPage(
//                   title: S.of(context).delivery_details,
//                 ),
//                 SizedBox(height: 17.5.h),
//                 DeliveryDetails(
//                   addressName: orderDetailsCubit
//                           .orderDetailsModel.item?.item?.address?.addressName ??
//                       "No address name",
//                   type: orderDetailsCubit
//                           .orderDetailsModel.item?.item?.address?.type
//                           .toString() ??
//                       "",
//                   street: orderDetailsCubit
//                           .orderDetailsModel.item?.item?.address?.street ??
//                       "",
//                   phone: orderDetailsCubit
//                       .orderDetailsModel.item?.item?.address?.mobileNumber,
//                   floorNumber: orderDetailsCubit
//                       .orderDetailsModel.item?.item?.address?.floorNumber,
//                   areaName: orderDetailsCubit
//                           .orderDetailsModel.item?.item?.address?.area?.name ??
//                       '',
//                 ),
//                 SizedBox(height: 30.h),
//                 TitleCheckPage(
//                   title: S.of(context).products,
//                 ),
//                 SizedBox(height: 13.h),
//                 ListView.separated(
//                   separatorBuilder: (context, index) {
//                     return SizedBox(height: 20.h);
//                   },
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: orderDetailsCubit
//                           .orderDetailsModel.item?.item?.products?.length ??
//                       0,
//                   itemBuilder: (context, index) {
//                     var product = orderDetailsCubit
//                         .orderDetailsModel.item?.item?.products?[index];

//                     return Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: AppColor.greyOpacity),
//                         borderRadius: BorderRadius.circular(13.r),
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: EdgeInsetsDirectional.only(top: 15.h),
//                             child: SizedBox(
//                               height: 98.w,
//                               width: 98.w,
//                               child: AspectRatio(
//                                 aspectRatio: 1,
//                                 child: CachedNetworkImage(
//                                   imageUrl: product?.product?.image ?? "",
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 9.w),
//                           Expanded(
//                             flex: 2,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(height: 13.h),
//                                 Text(
//                                   product?.product?.name ?? "No title",
//                                   style: AppStyles.textStyle18w700,
//                                 ),
//                                 SizedBox(height: 10.h),
//                                 Text(
//                                   product?.product?.price.toString() ?? "0",
//                                   style: AppStyles.textStyle18w700,
//                                 ),
//                                 Visibility(
//                                     visible: product?.variantId != null,
//                                     child: SizedBox(height: 10.h)),
//                                 if (product?.variantId != null) ...[
//                                   RichText(
//                                     text: TextSpan(
//                                       text: S.of(context).size,
//                                       style: AppStyles.textStyle16w400.copyWith(
//                                           color: AppColor.greyOpacity),
//                                       children: [
//                                         TextSpan(
//                                           text:
//                                               ": ${product?.product?.variants?.first.size?.name ?? ""}",
//                                           style: AppStyles.textStyle16w400
//                                               .copyWith(color: AppColor.black2),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height: 10.h),
//                                   if (product?.product?.variants?.isNotEmpty ??
//                                       false)
//                                     RichText(
//                                       text: TextSpan(
//                                         text: "Color",
//                                         style: AppStyles.textStyle16w400
//                                             .copyWith(
//                                                 color: AppColor.greyOpacity),
//                                         children: [
//                                           TextSpan(
//                                             text:
//                                                 ": ${product!.product!.variants!.first.color?.name}",
//                                             style: AppStyles.textStyle16w400
//                                                 .copyWith(
//                                                     color: AppColor.black2),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                 ],
//                                 SizedBox(height: 10.h),
//                                 RichText(
//                                   text: TextSpan(
//                                     text: "Quantity",
//                                     style: AppStyles.textStyle16w400
//                                         .copyWith(color: AppColor.greyOpacity),
//                                     children: [
//                                       TextSpan(
//                                         text:
//                                             ": ${product?.quantity.toString() ?? "0"}",
//                                         style: AppStyles.textStyle16w400
//                                             .copyWith(color: AppColor.black2),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 22.h),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//                 SizedBox(height: 30.h),
//                 TitleCheckPage(
//                   title: S.of(context).payment_details,
//                 ),
//                 SizedBox(
//                   height: 14.h,
//                 ),
//                 Container(
//                   decoration: AppStyles.checkoutContainerdecoration(),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 25.h,
//                       ),
//                       TextInPaymentDetailsContainer(
//                         title: "Payment Method",
//                         value: orderDetailsCubit
//                                 .orderDetailsModel.item?.item?.paymentMethod
//                                 .toString() ??
//                             "",
//                       ),
//                       SizedBox(
//                         height: 17.h,
//                       ),
//                       const Divider(),
//                       SizedBox(
//                         height: 13.h,
//                       ),
//                       TextInPaymentDetailsContainer(
//                         title: "Invoice Reference",
//                         value: orderDetailsCubit
//                                 .orderDetailsModel.item?.item?.invoiceReference
//                                 .toString() ??
//                             "No invoiceReference",
//                       ),
//                       SizedBox(
//                         height: 13.h,
//                       ),
//                       const Divider(),
//                       SizedBox(
//                         height: 17.h,
//                       ),
//                       TextInPaymentDetailsContainer(
//                         title: "Transaction ID",
//                         value: orderDetailsCubit
//                                 .orderDetailsModel.item?.item?.transactionId
//                                 .toString() ??
//                             "No invoiceReference",
//                       ),
//                       SizedBox(
//                         height: 13.h,
//                       ),
//                       const Divider(),
//                       SizedBox(
//                         height: 13.h,
//                       ),
//                       TextInPaymentDetailsContainer(
//                         title: "Subtotal",
//                         value: orderDetailsCubit
//                                 .orderDetailsModel.item?.item?.subTotal
//                                 .toString() ??
//                             "No invoiceReference",
//                       ),
//                       SizedBox(
//                         height: 17.h,
//                       ),
//                       const Divider(),
//                       SizedBox(
//                         height: 13.h,
//                       ),
//                       TextInPaymentDetailsContainer(
//                         title: "Discount",
//                         value: orderDetailsCubit
//                                 .orderDetailsModel.item?.item?.discount
//                                 .toString() ??
//                             "No invoiceReference",
//                       ),
//                       SizedBox(
//                         height: 17.h,
//                       ),
//                       const Divider(),
//                       SizedBox(
//                         height: 13.h,
//                       ),
//                       TextInPaymentDetailsContainer(
//                         title: "Delivery",
//                         value: orderDetailsCubit
//                                 .orderDetailsModel.item?.item?.totalPrice
//                                 .toString() ??
//                             "No invoiceReference",
//                       ),
//                       SizedBox(
//                         height: 17.h,
//                       ),
//                       const IntermittentDivider(
//                         dashWidth: 3,
//                         color: AppColor.greyText,
//                       ),
//                       SizedBox(
//                         height: 17.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: EdgeInsetsDirectional.only(start: 10.w),
//                             child: Text(
//                               "total",
//                               style: AppStyles.textStyle16w700
//                                   .copyWith(color: AppColor.pirateGold),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.only(end: 10.w),
//                             child: Text(
//                               orderDetailsCubit
//                                       .orderDetailsModel.item?.item?.totalPrice
//                                       .toString() ??
//                                   "",
//                               style: AppStyles.textStyle16w700
//                                   .copyWith(color: AppColor.pirateGold),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 25.h,
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50.h,
//                 )
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class DeliveryDetails extends StatelessWidget {
//   const DeliveryDetails({
//     super.key,
//     required this.type,
//     required this.phone,
//     required this.addressName,
//     required this.street,
//     required this.floorNumber,
//     required this.areaName,
//   });
//   final String? type, phone, addressName, street, floorNumber, areaName;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 361.w,
//       decoration: ShapeDecoration(
//         color: AppColor.containerBackColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 16.h),
//           Padding(
//             padding: EdgeInsetsDirectional.only(start: 14.w),
//             child: Text(
//               type ?? "",
//               style: AppStyles.textStyle18w700,
//             ),
//           ),
//           SizedBox(height: 23.h),
//           Padding(
//             padding: EdgeInsetsDirectional.only(start: 24.w),
//             child: Text(
//               phone ?? "",
//               style: AppStyles.textStyle16w400.copyWith(color: AppColor.black),
//             ),
//           ),
//           SizedBox(height: 23.h),
//           Padding(
//             padding: EdgeInsetsDirectional.only(start: 13.w),
//             child: ExpandableText(
//               '$addressName, $street, $floorNumber, $areaName',
//               style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
//               expandText: S.of(context).show_more,
//               collapseText: S.of(context).show_less,
//               maxLines: 4,
//               linkColor: AppColor.silver,
//             ),
//           ),
//           SizedBox(height: 16.h),
//           SizedBox(height: 24.h),
//         ],
//       ),
//     );
//   }
// }
