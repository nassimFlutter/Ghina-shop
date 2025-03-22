import 'package:best_price/feature/home/data/models/home_model.dart';

class Category {
  final int id;
  final String image;
  final int featured;
  final String status;
  final String createdAt;
  final String name;
  List<Product>? products;

  Category({
    required this.id,
    required this.image,
    required this.featured,
    required this.status,
    required this.createdAt,
    required this.name,
    this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List<dynamic>?;
    List<Product>? products; // Nullable list of products

    if (productList != null) {
      products =
          productList.map((product) => Product.fromJson(product)).toList();
    }

    return Category(
      id: json['id'],
      image: json['image'],
      featured: json['featured'],
      status: json['status'],
      createdAt: json['created_at'],
      name: json['name'],
      products: products, // Assigning nullable products list
    );
  }
}

class ProductCategoryResponse {
  final bool? status;
  final int? code;
  final String? message;
  final List<Category>? items;

  ProductCategoryResponse({
    this.status,
    this.code,
    this.message,
    this.items,
  });

  factory ProductCategoryResponse.fromJson(Map<String, dynamic> json) {
    // Handle null items
    List<Category>? categories;
    if (json['items'] != null) {
      var categoryList = json['items'] as List<dynamic>;
      categories =
          categoryList.map((category) => Category.fromJson(category)).toList();
    }

    return ProductCategoryResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      items: categories,
    );
  }
}
