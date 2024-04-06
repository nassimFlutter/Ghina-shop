import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLetStartText extends StatelessWidget {
  const ShimmerLetStartText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] ?? const Color(0xff0e0e0e),
      highlightColor: Colors.grey[100] ?? const Color(0xff0e0e0e),
      child: const Text(
        "Let’s start shopping!",
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
  }
}
