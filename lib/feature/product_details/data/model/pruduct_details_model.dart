import 'dart:convert';

class ProductDetailsModel {
  bool? status;
  int? code;
  String? message;
  Items? items;

  ProductDetailsModel({
    this.status,
    this.code,
    this.message,
    this.items,
  });

  factory ProductDetailsModel.fromRawJson(String str) =>
      ProductDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        items: json["items"] == null ? null : Items.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "items": items?.toJson(),
      };
}

class Items {
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
  String? brandName;
  String? companyName;
  String? title;
  List<Variant>? variants;
  List<Image>? images;

  Items({
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
    this.images,
  });

  factory Items.fromRawJson(String str) => Items.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["id"],
        categoryId: json["category_id"],
        image: json["image"],
        price: json["price"],
        discountPrice: json["discount_price"],
        featured: json["featured"],
        offerEndDate: json["offer_end_date"] == null
            ? null
            : DateTime.parse(json["offer_end_date"]),
        quantity: json["quantity"],
        isHasVariant: json["is_has_variant"],
        status: json["status"],
        markLabel: json["mark_label"],
        isBestSeller: json["is_best_seller"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
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
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "image": image,
        "price": price,
        "discount_price": discountPrice,
        "featured": featured,
        "offer_end_date":
            "${offerEndDate!.year.toString().padLeft(4, '0')}-${offerEndDate!.month.toString().padLeft(2, '0')}-${offerEndDate!.day.toString().padLeft(2, '0')}",
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
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class Image {
  int? id;
  int? productId;
  String? image;
  int? type;
  DateTime? createdAt;

  Image({
    this.id,
    this.productId,
    this.image,
    this.type,
    this.createdAt,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["product_id"],
        image: json["image"],
        type: json["type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image": image,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
      };
}

class Variant {
  int? id;
  int? productId;
  int? sizeId;
  int? colorId;
  String? price;
  int? quantity;
  dynamic discountPrice;
  dynamic offerEndDate;
  String? status;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Color? size;
  Color? color;

  Variant({
    this.id,
    this.productId,
    this.sizeId,
    this.colorId,
    this.price,
    this.quantity,
    this.discountPrice,
    this.offerEndDate,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.size,
    this.color,
  });

  factory Variant.fromRawJson(String str) => Variant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        productId: json["product_id"],
        sizeId: json["size_id"],
        colorId: json["color_id"],
        price: json["price"],
        quantity: json["quantity"],
        discountPrice: json["discount_price"],
        offerEndDate: json["offer_end_date"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        size: json["size"] == null ? null : Color.fromJson(json["size"]),
        color: json["color"] == null ? null : Color.fromJson(json["color"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "size_id": sizeId,
        "color_id": colorId,
        "price": price,
        "quantity": quantity,
        "discount_price": discountPrice,
        "offer_end_date": offerEndDate,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "size": size?.toJson(),
        "color": color?.toJson(),
      };
}

class Color {
  int? id;
  dynamic deletedAt;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  List<Translation>? translations;

  Color({
    this.id,
    this.deletedAt,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.translations,
  });

  factory Color.fromRawJson(String str) => Color.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        deletedAt: json["deleted_at"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        name: json["name"],
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deleted_at": deletedAt,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "name": name,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
      };
}

class Translation {
  int? id;
  int? colorId;
  String? name;
  String? locale;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? sizeId;

  Translation({
    this.id,
    this.colorId,
    this.name,
    this.locale,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.sizeId,
  });

  factory Translation.fromRawJson(String str) =>
      Translation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        colorId: json["color_id"],
        name: json["name"],
        locale: json["locale"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        sizeId: json["size_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color_id": colorId,
        "name": name,
        "locale": locale,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "size_id": sizeId,
      };
}
