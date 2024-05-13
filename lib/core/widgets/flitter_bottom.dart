import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/flitter_sort/presentaion/view/flitter_sort_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlitterBottom extends StatelessWidget {
  const FlitterBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HelperFunctions.navigateToScreen(
            context,
            FlitterSortView(
              endValue: 100,
            ));
      },
      child: Container(
        width: 40.h,
        height: 40.h,
        padding: const EdgeInsets.all(9),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFE6E6E6)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            IconsPath.flitterIcon,
            fit: BoxFit.cover,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
