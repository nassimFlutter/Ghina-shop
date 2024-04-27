import 'dart:convert';

import 'package:best_price/feature/home/data/models/home_model.dart';

class MyWishModel {
    bool? status;
    int? code;
    String? message;
    List<Product>? items;
    bool? isMore;

    MyWishModel({
        this.status,
        this.code,
        this.message,
        this.items,
        this.isMore,
    });

    factory MyWishModel.fromRawJson(String str) => MyWishModel.fromJson(json.decode(str));
    
    factory MyWishModel.fromJson(Map<String, dynamic> json) => MyWishModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        items: json["items"] == null ? [] : List<Product>.from(json["items"]!.map((x) => Product.fromJson(x))),
        isMore: json["is_more"],
    );

   
}
