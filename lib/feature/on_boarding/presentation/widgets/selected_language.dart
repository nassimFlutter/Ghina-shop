import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedLanguage extends StatelessWidget {
  const SelectedLanguage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.borderSide,
  });
  final String title, imagePath;
  final BorderSide borderSide;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: borderSide,
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: ListTile(
          leading: SvgPicture.asset(imagePath),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.sp,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
