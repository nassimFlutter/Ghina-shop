import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key,
    required this.trailing,
    required this.title,
    required this.iconPath,
    this.onTap,
  });
  final Widget trailing;
  final String title, iconPath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: SvgPicture.asset(
          iconPath,
          width: 24.w,
          height: 24.h,
          fit: BoxFit.cover,
        ),
        title: Text(
          title,
        ),
        trailing: trailing);
  }
}
