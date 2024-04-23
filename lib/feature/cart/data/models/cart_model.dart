import 'dart:convert';

class CartModel {
    bool? status;
    int? code;
    String? message;
    int? totalFinally;
    List<MyCart>? myCart;

    CartModel({
        this.status,
        this.code,
        this.message,
        this.totalFinally,
        this.myCart,
    });

    factory CartModel.fromRawJson(String str) => CartModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        totalFinally: json["totalFinally"],
        myCart: json["myCart"] == null ? [] : List<MyCart>.from(json["myCart"]!.map((x) => MyCart.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "totalFinally": totalFinally,
        "myCart": myCart == null ? [] : List<dynamic>.from(myCart!.map((x) => x.toJson())),
    };
}

class MyCart {
    int? id;
    int? userId;
    int? productId;
    int? quantity;
    DateTime? createdAt;
    dynamic variantId;
    int? maxQuantity;
    Product? product;

    MyCart({
        this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.createdAt,
        this.variantId,
        this.maxQuantity,
        this.product,
    });

    factory MyCart.fromRawJson(String str) => MyCart.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MyCart.fromJson(Map<String, dynamic> json) => MyCart(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        variantId: json["variant_id"],
        maxQuantity: json["max_quantity"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "variant_id": variantId,
        "max_quantity": maxQuantity,
        "product": product?.toJson(),
    };
}

class Product {
    int? id;
    int? categoryId;
    String? image;
    int? price;
    int? discountPrice;
    int? featured;
    DateTime? offerEndDate;
    int? quantity;
    String? isHasVariant;
    String? status;
    int? markLabel;
    int? isBestSeller;
    DateTime? createdAt;
    int? brandId;
    int? isCart;
    int? isOutStock;
    String? isFevorite;
    String? urlLink;
    String? description;
    String? name;
    dynamic brandName;
    String? companyName;
    String? title;
    List<dynamic>? variants;

    Product({
        this.id,
        this.categoryId,
        this.image,
        this.price,
        this.discountPrice,
        this.featured,
        this.offerEndDate,
        this.quantity,
        this.isHasVariant,
        this.status,
        this.markLabel,
        this.isBestSeller,
        this.createdAt,
        this.brandId,
        this.isCart,
        this.isOutStock,
        this.isFevorite,
        this.urlLink,
        this.description,
        this.name,
        this.brandName,
        this.companyName,
        this.title,
        this.variants,
    });

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        image: json["image"],
        price: json["price"],
        discountPrice: json["discount_price"],
        featured: json["featured"],
        offerEndDate: json["offer_end_date"] == null ? null : DateTime.parse(json["offer_end_date"]),
        quantity: json["quantity"],
        isHasVariant: json["is_has_variant"],
        status: json["status"],
        markLabel: json["mark_label"],
        isBestSeller: json["is_best_seller"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        brandId: json["brand_id"],
        isCart: json["is_cart"],
        isOutStock: json["is_out_stock"],
        isFevorite: json["is_fevorite"],
        urlLink: json["url_link"],
        description: json["description"],
        name: json["name"],
        brandName: json["brand_name"],
        companyName: json["company_name"],
        title: json["title"],
        variants: json["variants"] == null ? [] : List<dynamic>.from(json["variants"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "image": image,
        "price": price,
        "discount_price": discountPrice,
        "featured": featured,
        "offer_end_date": "${offerEndDate!.year.toString().padLeft(4, '0')}-${offerEndDate!.month.toString().padLeft(2, '0')}-${offerEndDate!.day.toString().padLeft(2, '0')}",
        "quantity": quantity,
        "is_has_variant": isHasVariant,
        "status": status,
        "mark_label": markLabel,
        "is_best_seller": isBestSeller,
        "created_at": createdAt?.toIso8601String(),
        "brand_id": brandId,
        "is_cart": isCart,
        "is_out_stock": isOutStock,
        "is_fevorite": isFevorite,
        "url_link": urlLink,
        "description": description,
        "name": name,
        "brand_name": brandName,
        "company_name": companyName,
        "title": title,
        "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x)),
    };
}
