import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ItemPaymentMethod extends StatelessWidget {
  const ItemPaymentMethod({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onChange,
    required this.value,
    required this.currentValue,
  });

  final String iconPath;
  final String title;
  final int value;
  final int currentValue;
  final Function(dynamic value) onChange;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(value);
      },
      child: Row(
        children: [
          SizedBox(
            height: 24,
            width: 36,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    // width: 1000.w,
                    // height: 140.h,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    // child: Image.asset(
                    //   Constant.kAdImage,
                    // ),
                  ),
                );
              },
              imageUrl: "$iconPath",
              errorWidget: (context, url, error) {
                return Icon(Icons.error);
                // Image.asset(
                //   imagePathOnError,
                //   fit: BoxFit.cover,
                // );
              },
            ),
          ), // SvgPicture.asset(iconPath),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Text(
              title,
              style: AppStyles.textStyle14w400,
            ),
          ),
          Radio(
            value: value,
            groupValue: currentValue,
            onChanged: onChange,
            activeColor: AppColor.black,
            // fillColor: AppColor.blueColor,
            // focusColor: AppColor.blackColor,
          ),
        ],
      ),
    );
  }
}
