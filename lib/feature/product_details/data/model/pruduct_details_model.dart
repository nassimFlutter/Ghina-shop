class ProductDetailsModel {
  final String? status;
  final String? message;
  final Data? data;
  final dynamic errors;
  const ProductDetailsModel(
      {this.status, this.message, this.data, this.errors});
  ProductDetailsModel copyWith(
      {String? status, String? message, Data? data, dynamic? errors}) {
    return ProductDetailsModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        errors: errors ?? this.errors);
  }

  Map<String, Object?> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
      'errors': errors
    };
  }

  static ProductDetailsModel fromJson(Map<String, Object?> json) {
    return ProductDetailsModel(
        status: json['status'] == null ? null : json['status'] as String,
        message: json['message'] == null ? null : json['message'] as String,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, Object?>),
        errors: json['errors'] as dynamic);
  }

  @override
  String toString() {
    return '''ProductDetailsModel(
                status:$status,
message:$message,
data:${data.toString()},
errors:$errors
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailsModel &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.message == message &&
        other.data == data &&
        other.errors == errors;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, message, data, errors);
  }
}

class Data {
  final int? id;
  final String? image;
  final String? video;
  final num? price;
  final num? discountPrice;
  final bool? featured;
  final String? offerEndDate;
  final int? quantity;
  final bool? isHasVariant;
  final String? status;
  final int? markLabel;
  final int? isBestSeller;
  final String? createdAt;
  final String? name;
  final String? description;
  final List<Images>? images;
  final List<dynamic>? variants;
  final int? minSellerQuantity;
  final bool? isSeller;
  final dynamic rate;
  const Data({
    this.id,
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
    this.name,
    this.description,
    this.images,
    this.variants,
    this.video,
    this.rate,
    this.minSellerQuantity,
    this.isSeller,
  });
  Data copyWith(
      {int? id,
      String? image,
      int? price,
      int? discountPrice,
      bool? featured,
      String? offerEndDate,
      int? quantity,
      bool? isHasVariant,
      String? status,
      int? markLabel,
      int? isBestSeller,
      String? createdAt,
      String? name,
      String? description,
      List<Images>? images,
      List<dynamic>? variants,
      dynamic? rate}) {
    return Data(
        id: id ?? this.id,
        image: image ?? this.image,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        featured: featured ?? this.featured,
        offerEndDate: offerEndDate ?? this.offerEndDate,
        quantity: quantity ?? this.quantity,
        isHasVariant: isHasVariant ?? this.isHasVariant,
        status: status ?? this.status,
        markLabel: markLabel ?? this.markLabel,
        isBestSeller: isBestSeller ?? this.isBestSeller,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        description: description ?? this.description,
        images: images ?? this.images,
        variants: variants ?? this.variants,
        rate: rate ?? this.rate);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'image': image,
      'price': price,
      'discount_price': discountPrice,
      'featured': featured,
      'offer_end_date': offerEndDate,
      'quantity': quantity,
      'is_has_variant': isHasVariant,
      'status': status,
      'mark_label': markLabel,
      'is_best_seller': isBestSeller,
      'created_at': createdAt,
      'name': name,
      'description': description,
      'images':
          images?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'variants': variants,
      'rate': rate
    };
  }

  static Data fromJson(Map<String, Object?> json) {
    return Data(
      id: json['id'] == null ? null : json['id'] as int,
      image: json['image'] == null ? null : json['image'] as String,
      video: json['video'] == null ? null : json['video'] as String,
      price: json['price'] == null ? null : json['price'] as num,
      discountPrice:
          json['discount_price'] == null ? null : json['discount_price'] as num,
      featured: json['featured'] == null ? null : json['featured'] as bool,
      offerEndDate: json['offer_end_date'] == null
          ? null
          : json['offer_end_date'] as String,
      quantity: json['quantity'] == null ? null : json['quantity'] as int,
      isHasVariant: json['is_has_variant'] == null
          ? null
          : json['is_has_variant'] as bool,
      status: json['status'] == null ? null : json['status'] as String,
      markLabel: json['mark_label'] == null ? null : json['mark_label'] as int,
      isBestSeller:
          json['is_best_seller'] == null ? null : json['is_best_seller'] as int,
      createdAt:
          json['created_at'] == null ? null : json['created_at'] as String,
      name: json['name'] == null ? null : json['name'] as String,
      description:
          json['description'] == null ? null : json['description'] as String,
      images: json['images'] == null
          ? null
          : (json['images'] as List)
              .map<Images>(
                  (data) => Images.fromJson(data as Map<String, Object?>))
              .toList(),
      variants:
          json['variants'] == null ? null : json['variants'] as List<dynamic>,
      rate: json['rate'] as dynamic,
      minSellerQuantity: json["min_seller_quantity"] == null
          ? null
          : json["min_seller_quantity"] as int,
      isSeller: json['isSeller'] == null ? null : json['isSeller'] as bool,
    );
  }

  @override
  String toString() {
    return '''Data(
                id:$id,
image:$image,
price:$price,
discountPrice:$discountPrice,
featured:$featured,
offerEndDate:$offerEndDate,
quantity:$quantity,
isHasVariant:$isHasVariant,
status:$status,
markLabel:$markLabel,
isBestSeller:$isBestSeller,
createdAt:$createdAt,
name:$name,
description:$description,
images:${images.toString()},
variants:$variants,
rate:$rate
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Data &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.image == image &&
        other.price == price &&
        other.discountPrice == discountPrice &&
        other.featured == featured &&
        other.offerEndDate == offerEndDate &&
        other.quantity == quantity &&
        other.isHasVariant == isHasVariant &&
        other.status == status &&
        other.markLabel == markLabel &&
        other.isBestSeller == isBestSeller &&
        other.createdAt == createdAt &&
        other.name == name &&
        other.description == description &&
        other.images == images &&
        other.variants == variants &&
        other.rate == rate;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        image,
        price,
        discountPrice,
        featured,
        offerEndDate,
        quantity,
        isHasVariant,
        status,
        markLabel,
        isBestSeller,
        createdAt,
        name,
        description,
        images,
        variants,
        rate);
  }
}

class Images {
  final String? image;
  final int? type;
  const Images({this.image, this.type});
  Images copyWith({String? image, int? type}) {
    return Images(image: image ?? this.image, type: type ?? this.type);
  }

  Map<String, Object?> toJson() {
    return {'image': image, 'type': type};
  }

  static Images fromJson(Map<String, Object?> json) {
    return Images(
        image: json['image'] == null ? null : json['image'] as String,
        type: json['type'] == null ? null : json['type'] as int);
  }

  @override
  String toString() {
    return '''Images(
                image:$image,
type:$type
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Images &&
        other.runtimeType == runtimeType &&
        other.image == image &&
        other.type == type;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, image, type);
  }
}
