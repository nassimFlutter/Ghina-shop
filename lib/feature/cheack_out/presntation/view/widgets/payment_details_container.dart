import 'package:best_price/feature/cheack_out/presntation/view/widgets/details_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_divider.dart';

class PaymentDetailsContainer extends StatelessWidget {
  const PaymentDetailsContainer({
    super.key,
  });

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
          const DetailsText(
            title: "Sub Total",
            value: 1019.800,
          ),
          const CustomDivider(),
          const DetailsText(
            title: "Discount",
            value: 0.000,
          ),
          const CustomDivider(),
          const DetailsText(
            title: 'Delivery',
            value: 0.000,
          ),
          const CustomDivider(),
          const DetailsText(
            title: "Total",
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
