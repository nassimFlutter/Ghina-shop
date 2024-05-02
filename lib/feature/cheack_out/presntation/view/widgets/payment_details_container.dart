import 'package:best_price/feature/cheack_out/presntation/view/widgets/details_text.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_divider.dart';

class PaymentDetailsContainer extends StatelessWidget {
  const PaymentDetailsContainer({
    super.key,
  });
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF9F9F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          DetailsText(
            title: S.of(context).sub_total, //"Sub Total",
            value: 1019.800,
          ),
          const CustomDivider(),
          DetailsText(
            title: S.of(context).discount, //"Discount",
            value: 0.000,
          ),
          const CustomDivider(),
          DetailsText(
            title: S.of(context).delivery, //'Delivery',
            value: 0.000,
          ),
          const CustomDivider(),
          DetailsText(
            title: S.of(context).total, //"Total",
            value: 1019.800,
          ),
          SizedBox(
            height: 46.h,
          ),
        ],
      ),
    );
  }
}
