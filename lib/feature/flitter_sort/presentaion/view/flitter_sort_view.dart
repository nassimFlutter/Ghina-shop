import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/flitter_sort/presentaion/manager/flitter_cubit/flitter_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/flitter_item.dart';

class FlitterSortView extends StatelessWidget {
  const FlitterSortView({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    FlitterCubit flitterCubit = FlitterCubit.get(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: Dimensions.dTopPadding.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 18.0.w),
                  child: Text(
                    S.of(context).reset, //'Reset',
                    style: AppStyles.textStyle17w700.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.dStartPadding.w),
            child: AppBarRowReverse(
              iconPath: IconsPath.cancelIcon,
              title: S.of(context).sort_by, //"Sort By",
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          BlocBuilder<FlitterCubit, FlitterState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: flitterCubit.sortByList.length,
                shrinkWrap: true,
                padding: EdgeInsetsDirectional.only(start: 16.w),
                itemBuilder: (context, index) {
                  return FlitterItem(
                      groupValue: flitterCubit.groupValueSort,
                      title: flitterCubit.sortByList[index],
                      value: index,
                      onChanged: (value) {
                        print(value);
                        print("clikc");
                        flitterCubit.changeGroupValueSort(value ?? -1);
                      });
                },
              );
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          BlocBuilder<FlitterCubit, FlitterState>(
            builder: (context, state) {
              return Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  colorScheme: const ColorScheme.light(
                    primary: Colors.black,
                  ),
                ),
                child: ExpansionTile(
                  collapsedIconColor: Colors.black,
                  title: Text(
                    S.of(context).brands, // "Brands",
                    style: AppStyles.textStyle18w700,
                  ),
                  children: [
                    ListView.builder(
                      itemCount: flitterCubit.brandsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        String brand = flitterCubit.brandsList[index];
                        bool isChecked =
                            flitterCubit.selectedBrandsList.contains(brand);
                        return Padding(
                          padding: EdgeInsetsDirectional.only(start: 16.w),
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 18.h,
                              // ),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.black,
                                    value: isChecked,
                                    onChanged: (value) {
                                      if (value != null) {
                                        if (value) {
                                          flitterCubit.selectBrand(brand);
                                        } else {
                                          flitterCubit.deselectBrand(brand);
                                        }
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(flitterCubit.brandsList[index],
                                      style: AppStyles.textStyle16w400
                                          .copyWith(color: Colors.black)),
                                ],
                              ),
                              // SizedBox(
                              //   height: 18.h,
                              // ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: const Divider(
                                  color: AppColor.borderColor,
                                ),
                              )
                            ],
                          ),
                        );
                        // return ListTile(
                        //   contentPadding:
                        //       REdgeInsetsDirectional.only(start: 15.w),
                        //   leading: Checkbox(
                        //     checkColor: Colors.white,
                        //     activeColor: Colors.black,
                        //     value: isChecked,
                        //     onChanged: (value) {
                        //       if (value != null) {
                        //         if (value) {
                        //           flitterCubit.selectBrand(brand);
                        //         } else {
                        //           flitterCubit.deselectBrand(brand);
                        //         }
                        //       }
                        //     },
                        //   ),
                        //   title: Text(flitterCubit.brandsList[index]),
                        // );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          BlocBuilder<FlitterCubit, FlitterState>(
            builder: (context, state) {
              return Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  colorScheme: const ColorScheme.light(
                    primary: Colors.black,
                  ),
                ),
                child: ExpansionTile(
                  collapsedIconColor: Colors.black,
                  title: Text(
                    S.of(context).category, // "Category",
                    style: AppStyles.textStyle18w700,
                  ),
                  children: [
                    ListView.builder(
                      itemCount: flitterCubit.categoryList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        String category = flitterCubit.categoryList[index];
                        bool isChecked =
                            flitterCubit.categoryListSleeted.contains(category);

                        return Padding(
                          padding: EdgeInsetsDirectional.only(start: 16.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 18.h,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.black,
                                    value: isChecked,
                                    onChanged: (value) {
                                      if (value != null) {
                                        if (value) {
                                          flitterCubit.selectCategory(category);
                                        } else {
                                          flitterCubit
                                              .deselectCategory(category);
                                        }
                                      }
                                    },
                                  ),
                                  Text(
                                    flitterCubit.categoryList[index],
                                    style: AppStyles.textStyle16w400
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: const Divider(
                                  color: AppColor.borderColor,
                                ),
                              )
                            ],
                          ),
                        );
                        // return ListTile(
                        //   leading: Checkbox(
                        //     checkColor: Colors.white,
                        //     activeColor: Colors.black,
                        //     value: isChecked,
                        //     onChanged: (value) {
                        //       if (value != null) {
                        //         if (value) {
                        //           flitterCubit.selectCategory(category);
                        //         } else {
                        //           flitterCubit.deselectCategory(category);
                        //         }
                        //       }
                        //     },
                        //   ),
                        //   title: Text(flitterCubit.categoryList[index]),
                        // );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 70.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: AppBottom(title: "Apply"),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

class AppBarRowReverse extends StatelessWidget {
  const AppBarRowReverse({
    super.key,
    required this.iconPath,
    required this.title,
  });
  final String iconPath, title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.textStyle18w700,
        ),
        AppBarBottom(iconPath: iconPath),
      ],
    );
  }
}
