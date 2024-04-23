import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/feature/cart/presentation/widgets/custom_edit_button.dart';
import 'package:flutter/material.dart';

class CustomEditQuantity extends StatelessWidget {
  const CustomEditQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomEditButton(
          color: AppColor.greyOpacity,
          onTap: () {},
          child: const Icon(
            Icons.remove,
          ),
        ),
        SizedBox(
          width: 42,
          child: Center(
            child: Text(
              '01',
              style: AppStyles.textStyle16w700.copyWith(
                color: AppColor.black,
              ),
            ),
          ),
        ),
        CustomEditButton(
          color: AppColor.corn,
          onTap: () {},
          child: const Icon(
            Icons.add,
          ),
        ),
      ],
    );
  }
}
