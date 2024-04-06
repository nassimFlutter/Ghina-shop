import 'package:flutter/material.dart';
import '../widgets/product_category_view_body.dart';

class ProductCategoryView extends StatelessWidget {
  const ProductCategoryView(
      {super.key, required this.title, required this.categoryId});
  final String title;
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductCategoryViewBody(
        title: title,
        id: categoryId,
      ),
    );
  }
}
