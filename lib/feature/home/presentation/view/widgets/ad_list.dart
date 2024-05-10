import 'package:best_price/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:best_price/feature/home/presentation/view/widgets/ad_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdList extends StatelessWidget {
  const AdList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: homeCubit.bannersList.length,
        itemBuilder: (context, index) {
          return AdItem(
            banner: homeCubit.bannersList[index],
          );
        },
      ),
    );
  }
}
