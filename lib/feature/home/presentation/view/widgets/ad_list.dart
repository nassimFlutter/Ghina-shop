import 'package:best_price/feature/home/presentation/view/widgets/ad_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdList extends StatelessWidget {
  const AdList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const AdItem();
        },
      ),
    );
  }
}
