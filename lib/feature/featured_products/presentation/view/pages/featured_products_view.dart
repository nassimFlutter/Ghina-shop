import 'package:flutter/material.dart';

import '../widgets/featured_product_view_body.dart';

class FeaturedProductView extends StatelessWidget {
  const FeaturedProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FeaturedProductViewBody(),
      ),
    );
  }
}
