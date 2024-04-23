import 'package:best_price/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomEditButton extends StatelessWidget {
  const CustomEditButton({
    super.key,
    required this.color,
    this.onTap,
    required this.child,
  });
  final Color color;
  final void Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(
        Dimensions.dBorderRadios,
      ),
      color: color,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          Dimensions.dBorderRadios,
        ),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.dBorderRadios,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
