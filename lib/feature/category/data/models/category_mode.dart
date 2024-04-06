

import 'package:best_price/feature/home/data/models/home_model.dart';

class CategoryResponse {
  final bool? status;
  final int? code;
  final String? message;
  final List<Category>? items;

  CategoryResponse({
     this.status,
     this.code,
     this.message,
     this.items,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    List<Category> categories = [];
    if (json['items'] != null) {
      categories = List<Category>.from(
          json['items'].map((category) => Category.fromJson(category)));
    }

    return CategoryResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      items: categories,
    );
  }
}
