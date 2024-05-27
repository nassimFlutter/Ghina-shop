import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlitterItem extends StatelessWidget {
  const FlitterItem({
    super.key,
    required this.title,
    required this.groupValue,
    required this.value,
    this.onChanged,
  });
  final String title;
  final int groupValue, value;
  final void Function(int?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
        // print("5555:: ${value}");
      },
      child: Column(
        children: [
          Row(
            children: [
              Radio(
                groupValue: groupValue,
                value: value,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              SizedBox(
                width: 16.w,
              ),
              Text(
                title,
                style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
              ),
            ],
          ),
          // ListTile(
          //   // contentPadding: EdgeInsets.zero,
          //   contentPadding: EdgeInsetsDirectional.only(start: 5.w),
          //   leading: Radio(
          //     groupValue: groupValue,
          //     value: value,
          //     onChanged: onChanged,
          //     activeColor: Colors.black,
          //   ),
          //   title: Text(
          //     title,
          //     style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(),
          )
        ],
      ),
    );
  }
}
