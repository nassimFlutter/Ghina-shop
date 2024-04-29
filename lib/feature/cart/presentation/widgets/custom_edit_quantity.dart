import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/feature/account/presentation/manager/change_address_page/change_address_page_cubit.dart';
import 'package:best_price/feature/cart/presentation/manager/change_quantity_cubit/change_quantity_cubit.dart';
import 'package:best_price/feature/cart/presentation/widgets/custom_edit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomEditQuantity extends StatelessWidget {
  const CustomEditQuantity({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    ChangeQuantityCubit changeQuantityCubit = ChangeQuantityCubit.get(context);
    return BlocConsumer<ChangeQuantityCubit, ChangeQuantityState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          children: [
            CustomEditButton(
              color: AppColor.greyOpacity,
              onTap: () {
                changeQuantityCubit.decrementQuantity(id);
              },
              child: const Icon(
                Icons.remove,
              ),
            ),
            SizedBox(
              width: 42,
              child: Center(
                child: TextField(
                  controller: changeQuantityCubit.textEditingControllers[id],
                  textAlign: TextAlign.center,
                  readOnly: false,
                  decoration: const InputDecoration(
                    // hintText:
                    //     changeQuantityCubit.textEditingControllers[id]?.text ??
                    //         "",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: AppStyles.textStyle16w700.copyWith(
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
            CustomEditButton(
              color: AppColor.corn,
              onTap: () {
                changeQuantityCubit.incrementQuantity(id);
              },
              child: const Icon(
                Icons.add,
              ),
            ),
          ],
        );
      },
    );
  }
}
