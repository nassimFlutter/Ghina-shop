import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({
    super.key,
    required this.imagePath,
    required this.color,
    this.onTap,
  });
  final String imagePath;
  final Color color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColor.borderColor)),
        ),      
        child: Center(
            child: SvgPicture.asset(
          imagePath,
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
