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
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text(
                    "",
                    style: AppStyles.textStyle14,
                  ),
                  value: _selectedCategoryName,
                  items: categories
                      .map((category) => DropdownMenuItem<String>(
                            value: category.name,
                            child: Text(category.name ?? ""),
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
            );
          }
        },
      ),
    );
  }
}
