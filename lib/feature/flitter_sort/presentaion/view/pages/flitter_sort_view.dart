import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/flitter_sort/presentaion/manager/flitter_cubit/flitter_cubit.dart';
import 'package:best_price/feature/flitter_sort/presentaion/manager/slider_cubit/slider_cubit.dart';
import 'package:best_price/feature/flitter_sort/presentaion/view/widgets/custom_check_box.dart';
import 'package:best_price/feature/flitter_sort/presentaion/view/widgets/custom_slider.dart';
import 'package:best_price/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/flitter_item.dart';

class FlitterSortView extends StatelessWidget {
  const FlitterSortView({super.key, required this.endValue, this.page});
// todo : finish translate
  final double endValue;
  final String? page;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FlitterCubit()
            ..setMaxPrice(maxPrice: endValue.round())
            ..setCategoryList(
                BlocProvider.of<HomeCubit>(context).categoriesList)
            ..setPage(page),
        ),
        BlocProvider(
          create: (context) => SliderCubit()
            ..setImportantAttribute(
              max: endValue,
              min: 0,
              rangeValues: RangeValues(0, endValue),
              division: endValue.toInt(),
            ),
        ),
      ],
      child: Scaffold(
        body: FilterPageBody(
          endValue: endValue,
        ),
      ),
    );
  }
}

class FilterPageBody extends StatelessWidget {
  const FilterPageBody({
    super.key,
    required this.endValue,
  });
  final double endValue;

  @override
  Widget build(BuildContext context) {
    FlitterCubit flitterCubit = FlitterCubit.get(context);
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: Dimensions.dTopPadding.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: 0.0.w,
                  ),
                  child: TextButton(
                    child: Text(
                      S.of(context).reset, //'Reset',
                      style: AppStyles.textStyle17w700.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      flitterCubit.resetAllControllers(endValue.round());
                      BlocProvider.of<SliderCubit>(context)
                          .setImportantAttribute(
                        max: endValue,
                        min: 0,
                        rangeValues: RangeValues(0, endValue),
                        division: endValue.toInt(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 26.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.dStartPadding.w),
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
              physics: const NeverScrollableScrollPhysics(),
              padding:
                  EdgeInsets.zero, //EdgeInsetsDirectional.only(start: 16.w),
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
                trailing: flitterCubit.brandsIsOpen
                    ? SvgPicture.asset(IconsPath.toTopArrow)
                    : SvgPicture.asset(IconsPath.toDownArrow),
                onExpansionChanged: (value) {
                  flitterCubit.changeOpenBrandsOrCategory(
                    isBrand: true,
                    isOpen: value,
                  );

                  debugPrint('value: ${value}');
                },
                title: Text(
                  S.of(context).brands, // "Brands",
                  style: AppStyles.textStyle18w700,
                ),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 16.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 18.h,
                              ),
                              Row(
                                children: [
                                  // CustomCheckBox(
                                  //   value: isChecked,
                                  //   // onChange: (value) {
                                  //   //   if (value != null) {
                                  //   //     if (value) {
                                  //   //       flitterCubit.selectBrand(brand);
                                  //   //     } else {
                                  //   //       flitterCubit.deselectBrand(brand);
                                  //   //     }
                                  //   //   }
                                  //   // },
                                  // ),
                                  // Checkbox(
                                  //   checkColor: Colors.white,
                                  //   activeColor: Colors.black,
                                  //   value: isChecked,
                                  //   onChanged: (value) {
                                  //     if (value != null) {
                                  //       if (value) {
                                  //         flitterCubit.selectBrand(brand);
                                  //       } else {
                                  //         flitterCubit.deselectBrand(brand);
                                  //       }
                                  //     }
                                  //   },
                                  // ),

                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  // Text(
                                  //     flitterCubit.brandsList[index].name ?? "",
                                  //     style: AppStyles.textStyle16w400
                                  //         .copyWith(color: Colors.black)),
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
                trailing: flitterCubit.categoryIsOpen
                    ? SvgPicture.asset(IconsPath.toTopArrow)
                    : SvgPicture.asset(IconsPath.toDownArrow),
                onExpansionChanged: (value) {
                  flitterCubit.changeOpenBrandsOrCategory(
                    isBrand: false,
                    isOpen: value,
                  );

                  debugPrint('value: ${value}');
                },
                title: Text(
                  S.of(context).category, // "Category",
                  style: AppStyles.textStyle18w700,
                ),
                children: [
                  ListView.builder(
                    itemCount: flitterCubit.categoryList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      // String category = flitterCubit.categoryList[index];
                      bool isChecked =
                          flitterCubit.categoryList[index].isSelected;

                      return InkWell(
                        onTap: () {
                          if (isChecked) {
                            flitterCubit.deselectCategory(index);
                          } else {
                            flitterCubit.selectCategory(index);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 16.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 18.h,
                              ),
                              Row(
                                children: [
                                  CustomCheckBox(
                                    value: isChecked,
                                    // onChange: (value) {
                                    //   if (value != null) {
                                    //     if (value) {
                                    //       flitterCubit.selectCategory(category);
                                    //     } else {
                                    //       flitterCubit.deselectCategory(category);
                                    //     }
                                    //   }
                                    // },
                                  ),
                                  // Checkbox(
                                  //   checkColor: Colors.white,
                                  //   activeColor: Colors.black,
                                  //   value: isChecked,
                                  //   onChanged: (value) {
                                  //     if (value != null) {
                                  //       if (value) {
                                  //         flitterCubit.selectCategory(category);
                                  //       } else {
                                  //         flitterCubit.deselectCategory(category);
                                  //       }
                                  //     }
                                  //   },
                                  // ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    flitterCubit.categoryList[index].name ?? "",
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
          height: 44.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.dStartPadding.w),
          child: Text(
            S.of(context).price,
            style: AppStyles.textStyle18w700,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        BlocBuilder<FlitterCubit, FlitterState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSliderRecorder(
                      content: flitterCubit.minPrice.toString()),
                  CustomSliderRecorder(
                      content: flitterCubit.maxPrice.toString()),
                ],
              ),
            );
          },
        ),
        CustomSlider(
          division: endValue.toInt(),
          max: endValue,
          min: 0,
          onChange: (values) {
            print(values.start);
            print(values.end);
            // flitterCubit.minPrice = values.start.round();
            // flitterCubit.maxPrice = values.end.round();
            flitterCubit.changeSliderValue(
              maxPrice: values.end.round(),
              minPrice: values.start.round(),
            );
          },
          rangeValues: RangeValues(0, endValue),

          // onChange: (startValue, endValue) {
          //   print(startValue);
          // },
          // endValue: 1000, //endValue ?? 0,
          // values: RangeValues(0, 1000),
        ),
        SizedBox(
          height: 70.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          child: AppBottom(
            title: S.of(context).apply, //"Apply",
            onTap: () {
              Navigator.of(context)
                  .pop(flitterCubit.filterQuery(endValue.round()));
            },
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}

class CustomSliderRecorder extends StatelessWidget {
  const CustomSliderRecorder({
    super.key,
    required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 20.w,
        vertical: 11.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.backColorSize,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Text(
        content,
        style: AppStyles.textStyle14w400.copyWith(
          color: AppColor.black,
        ),
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
