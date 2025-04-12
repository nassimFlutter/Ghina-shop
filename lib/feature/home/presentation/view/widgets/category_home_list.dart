import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/category/presentaion/view/pages/product_category_view.dart';
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
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryHomeItem(
                  categoryTitle: category.name ?? "",
                  imageUrl: category.image ?? "",
                  categoryId: category.id ?? -1,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: DropdownButtonHideUnderline(
              child: Container(
                width: 100.w,
                height: 36.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: DropdownButton<String>(
                  isDense: true,
                  isExpanded: true,
                  hint: Text(
                    "",
                    style: AppStyles.textStyle14.copyWith(fontSize: 12.sp),
                  ),
                  value: _selectedCategoryName,
                  icon: Icon(Icons.arrow_drop_down, size: 16.sp),
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
                    HelperFunctions.navigateToScreen(
                      context,
                      ProductCategoryView(
                        title: selectedCategory.name ?? "",
                        categoryId: selectedCategory.id ?? -1,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
