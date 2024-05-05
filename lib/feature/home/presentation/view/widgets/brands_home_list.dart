import 'package:best_price/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:best_price/feature/home/presentation/view/widgets/brands_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsHomeList extends StatelessWidget {
  const BrandsHomeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return SizedBox(
      height: 62.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: homeCubit.homeApiResponse.item?.brands?.length ?? 0,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return BrandsItem(
              title: homeCubit.homeApiResponse.item?.brands?[index].name ?? "",
              brandId: homeCubit.homeApiResponse.item?.brands?[index].id ?? -1,
              imageUrl:
                  homeCubit.homeApiResponse.item?.brands?[index].image ?? "");
        },
      ),
    );
  }
}
