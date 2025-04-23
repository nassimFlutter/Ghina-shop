import 'dart:convert';

import 'package:best_price/feature/home/data/models/home_model.dart';

class MyWishModel {
  final String? status;
  final String? message;
  final List<Product>? items;

  const MyWishModel({
    this.status,
    this.message,
    this.items,
  });

  factory MyWishModel.fromJson(Map<String, dynamic> json) {
    final favoritesData =
        json['data']?['favorites']?['favorites'] as List<dynamic>?;

    List<Product> parsedProducts = [];
    if (favoritesData != null) {
      for (var fav in favoritesData) {
        final productJson = fav['product'];
        if (productJson != null) {
          parsedProducts.add(Product.fromJson(productJson));
        }
      }
    }

    return MyWishModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      items: parsedProducts,
    );
  }

  factory MyWishModel.fromRawJson(String str) =>
      MyWishModel.fromJson(json.decode(str));
}
