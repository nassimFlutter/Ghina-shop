import 'package:best_price/feature/best_selling/presntations/view/widgets/best_selling_body.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: BestSellingBody()),
    );
  }
}
