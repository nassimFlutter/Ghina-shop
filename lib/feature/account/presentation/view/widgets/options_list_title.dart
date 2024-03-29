import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionsListTitle extends StatelessWidget {
  const OptionsListTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        fontFamily: 'Josefin Sans',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
