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
      height: 190.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeCubit.homeApiResponse.item?.banners?.length,
        itemBuilder: (context, index) {
          return AdItem(
            banner: homeCubit.homeApiResponse.item?.banners?[index],
          );
        },
      ),
    );
  }
}
