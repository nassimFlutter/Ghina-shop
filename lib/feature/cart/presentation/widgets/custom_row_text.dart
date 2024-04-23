import 'package:flutter/material.dart';

class CustomRowText extends StatelessWidget {
  const CustomRowText({
    super.key,
    required this.text1,
    required this.text2,
    required this.textStyle1,
    required this.textStyle2,
  });
  final String text1;
  final String text2;
  final TextStyle textStyle1;
  final TextStyle textStyle2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1, //'Sub Total',
          style: textStyle1, //AppStyles.textStyle18w400,
        ),
        Expanded(
          child: Text(
            text2, //'1019.800 KD',
            style: textStyle2, //AppStyles.textStyle18w700,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
