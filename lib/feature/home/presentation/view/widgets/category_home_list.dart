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
            flex: 3,
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
            child: SizedBox(
              width: 100,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down, size: 16.sp),
                  isExpanded: true,
                  value: null, // This hides the selected value
                  hint: const SizedBox.shrink(), // No hint text
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category.name,
                      child: Text(
                        category.name ?? "",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    );
                  }).toList(),
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
