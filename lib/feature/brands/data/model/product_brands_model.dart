import 'package:best_price/feature/home/data/models/home_model.dart';

class Brands {
  final int id;
  final String image;
  final int featured;
  final String status;
  final String createdAt;
  final String name;
  final List<Product>? products;

  Brands({
    required this.id,
    required this.image,
    required this.featured,
    required this.status,
    required this.createdAt,
    required this.name,
    this.products,
  });

  factory Brands.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List<dynamic>?;
    List<Product>? products; // Nullable list of products

    if (productList != null) {
      products =
          productList.map((product) => Product.fromJson(product)).toList();
    }

    return Brands(
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

class ProductBrandsResponse {
  final bool? status;
  final int? code;
  final String? message;
  final List<Brands>? items;

  ProductBrandsResponse({
    this.status,
    this.code,
    this.message,
    this.items,
  });

  factory ProductBrandsResponse.fromJson(Map<String, dynamic> json) {
    // Handle null items
    List<Brands>? brands;
    if (json['items'] != null) {
      var brandsList = json['items'] as List<dynamic>;
      brands = brandsList.map((category) => Brands.fromJson(category)).toList();
    }

    return ProductBrandsResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      items: brands,
    );
  }
}
