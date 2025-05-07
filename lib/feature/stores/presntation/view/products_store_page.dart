import 'package:best_price/core/widgets/whats_app_fab.dart';
import 'package:best_price/feature/stores/presntation/view/products_store_page_body.dart';
import 'package:flutter/material.dart';

class ProductsStorePage extends StatelessWidget {
  const ProductsStorePage(
      {Key? key, required this.storeId, required this.phone})
      : super(key: key);
  final int storeId;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: WhatsAppFloatingButton(
        phoneNumber: phone,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ProductsStorePageBody(
          storeId: storeId,
          phone: phone,
        ),
      ),
    );
  }
}
