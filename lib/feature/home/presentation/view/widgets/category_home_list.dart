import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:best_price/feature/home/presentation/view/widgets/category_home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryHomeList extends StatefulWidget {
  const CategoryHomeList({super.key});

  @override
  State<CategoryHomeList> createState() => _CategoryHomeListState();
}

class _CategoryHomeListState extends State<CategoryHomeList> {
  String? _selectedCategoryName;

  @override
  Widget build(BuildContext context) {
    final homeCubit = HomeCubit.get(context);
    final categories = homeCubit.categoriesList;

    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        itemBuilder: (context, index) {
          if (index < categories.length) {
            final category = categories[index];
            return CategoryHomeItem(
              categoryTitle: category.name ?? "",
              imageUrl: category.image ?? "",
              categoryId: category.id ?? -1,
            );
          } else {
            // This is the dropdown item
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 4.w), // reduced horizontal padding
              child: DropdownButtonHideUnderline(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 36.h, // reduce height
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: DropdownButton<String>(
                    isDense: true, // compact dropdown
                    isExpanded: false,
                    hint: Text(
                      "",
                      style: AppStyles.textStyle14
                          .copyWith(fontSize: 12.sp), // smaller font
                    ),
                    value: _selectedCategoryName,
                    icon: Icon(Icons.arrow_drop_down,
                        size: 16.sp), // smaller icon
                    items: categories
                        .map((category) => DropdownMenuItem<String>(
                              value: category.name,
                              child: Text(
                                category.name ?? "",
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ))
                        .toList(),
                    onChanged: (selected) {
                      setState(() {
                        _selectedCategoryName = selected;
                      });

                      final selectedCategory = categories.firstWhere(
                        (cat) => cat.name == selected,
                        orElse: () => categories[0],
                      );
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
