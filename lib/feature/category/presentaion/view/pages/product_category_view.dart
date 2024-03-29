import 'package:flutter/material.dart';
import '../widgets/product_category_view_body.dart';

class ProductCategoryView extends StatelessWidget {
  const ProductCategoryView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductCategoryViewBody(title: title),
    );
  }
}
