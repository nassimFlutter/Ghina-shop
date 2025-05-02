import 'package:best_price/feature/stores/presntation/view/products_store_page_body.dart';
import 'package:flutter/material.dart';

class ProductsStorePage extends StatelessWidget {
  const ProductsStorePage({Key? key, required this.storeId}) : super(key: key);
  final int storeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ProductsStorePageBody(
          storeId: storeId,
        ),
      ),
    );
  }
}
