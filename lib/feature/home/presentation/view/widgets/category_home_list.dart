import 'package:best_price/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:best_price/feature/home/presentation/view/widgets/category_home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryHomeList extends StatelessWidget {
  const CategoryHomeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryHomeItem(
            categoryTitle: homeCubit.categoryTitleList[index],
            imageUrl: homeCubit.imageList[index],
          );
        },
      ),
    );
  }
}
