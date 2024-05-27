import 'package:best_price/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    this.onChange,
    this.value = false,
  });
  final void Function(bool? value)? onChange;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      width: 21,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Checkbox(
        value: value,
        onChanged: onChange,
        checkColor: Colors.black,
        side: const BorderSide(
          color: Colors.white, //AppColor.pageBackGround,
          // width: 1.5,
        ),
        fillColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            // Return white color when checkbox is enabled
            if (states.contains(MaterialState.selected)) {
              return Colors.white; //AppColor.pageBackGround;
            }
            // Return transparent color when checkbox is disabled
            return Colors.white; //AppColor.pageBackGround;
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
