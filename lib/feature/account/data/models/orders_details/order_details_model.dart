import 'dart:convert';

class OrderDetailsModel {
  bool? status;
  int? code;
  String? message;
  OrderDetailsModelItem? item;

  OrderDetailsModel({
    this.status,
    this.code,
    this.message,
    this.item,
  });

  factory OrderDetailsModel.fromRawJson(String str) =>
      OrderDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        item: json["item"] == null
            ? null
            : OrderDetailsModelItem.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "item": item?.toJson(),
      };
}

class OrderDetailsModelItem {
  ItemItem? item;
  DateTime? serverTime;

  OrderDetailsModelItem({
    this.item,
    this.serverTime,
  });

  factory OrderDetailsModelItem.fromRawJson(String str) =>
      OrderDetailsModelItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderDetailsModelItem.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModelItem(
        item: json["item"] == null ? null : ItemItem.fromJson(json["item"]),
        serverTime: json["server_time"] == null
            ? null
            : DateTime.parse(json["server_time"]),
      );

  Map<String, dynamic> toJson() => {
        "item": item?.toJson(),
        "server_time": serverTime?.toIso8601String(),
      };
}

class ItemItem {
  int? id;
  dynamic pnmId;
  int? userId;
  int? totalPrice;
  int? totalCommissionAmount;
  int? addressId;
  dynamic discount;
  int? deliveryCost;
  String? discountCode;
  int? subTotal;
  int? countItems;
  String? name;
  String? email;
  String? mobile;
  dynamic paymentId;
  dynamic transactionId;
  dynamic paymentJson;
  dynamic paymentCheckResponse;
  int? paymentMethod;
  String? paymentToken;
  int? paymentStatus;
  int? status;
  int? cancelType;
  dynamic invoiceId;
  dynamic invoiceReference;
  dynamic refundId;
  dynamic refundReference;
  String? orderedDate;
  DateTime? createdAt;
  String? statusName;
  List<ProductElement>? products;
  Address? address;

  ItemItem({
    this.id,
    this.pnmId,
    this.userId,
    this.totalPrice,
    this.totalCommissionAmount,
    this.addressId,
    this.discount,
    this.deliveryCost,
    this.discountCode,
    this.subTotal,
    this.countItems,
    this.name,
    this.email,
    this.mobile,
    this.paymentId,
    this.transactionId,
    this.paymentJson,
    this.paymentCheckResponse,
    this.paymentMethod,
    this.paymentToken,
    this.paymentStatus,
    this.status,
    this.cancelType,
    this.invoiceId,
    this.invoiceReference,
    this.refundId,
    this.refundReference,
    this.orderedDate,
    this.createdAt,
    this.statusName,
    this.products,
    this.address,
  });

  factory ItemItem.fromRawJson(String str) =>
      ItemItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        id: json["id"],
        pnmId: json["PNM_ID"],
        userId: json["user_id"],
        totalPrice: json["total_price"],
        totalCommissionAmount: json["total_commission_amount"],
        addressId: json["address_id"],
        discount: json["discount"],
        deliveryCost: json["delivery_cost"],
        discountCode: json["discount_code"],
        subTotal: json["sub_total"],
        countItems: json["count_items"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        paymentId: json["payment_id"],
        transactionId: json["transaction_id"],
        paymentJson: json["payment_json"],
        paymentCheckResponse: json["payment_check_response"],
        paymentMethod: json["payment_method"],
        paymentToken: json["payment_token"],
        paymentStatus: json["payment_status"],
        status: json["status"],
        cancelType: json["cancel_type"],
        invoiceId: json["invoice_id"],
        invoiceReference: json["invoice_reference"],
        refundId: json["refund_id"],
        refundReference: json["refund_reference"],
        orderedDate: json["ordered_date"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        statusName: json["status_name"],
        products: json["products"] == null
            ? []
            : List<ProductElement>.from(
                json["products"]!.map((x) => ProductElement.fromJson(x))),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "PNM_ID": pnmId,
        "user_id": userId,
        "total_price": totalPrice,
        "total_commission_amount": totalCommissionAmount,
        "address_id": addressId,
        "discount": discount,
        "delivery_cost": deliveryCost,
        "discount_code": discountCode,
        "sub_total": subTotal,
        "count_items": countItems,
        "name": name,
        "email": email,
        "mobile": mobile,
        "payment_id": paymentId,
        "transaction_id": transactionId,
        "payment_json": paymentJson,
        "payment_check_response": paymentCheckResponse,
        "payment_method": paymentMethod,
        "payment_token": paymentToken,
        "payment_status": paymentStatus,
        "status": status,
        "cancel_type": cancelType,
        "invoice_id": invoiceId,
        "invoice_reference": invoiceReference,
        "refund_id": refundId,
        "refund_reference": refundReference,
        "created_at": createdAt?.toIso8601String(),
        "status_name": statusName,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "address": address?.toJson(),
      };
}

class Address {
  int? id;
  int? userId;
  String? addressName;
  int? areaId;
  String? block;
  String? street;
  String? avenue;
  int? type;
  dynamic buildingNumber;
  dynamic floorNumber;
  dynamic apartmentNumber;
  dynamic houseNumber;
  dynamic officeNumber;
  String? notes;
  DateTime? createdAt;
  String? fullName;
  String? flatNumber;
  dynamic mobileNumber;
  dynamic extraDirections;
  Area? area;

  Address({
    this.id,
    this.userId,
    this.addressName,
    this.areaId,
    this.block,
    this.street,
    this.avenue,
    this.type,
    this.buildingNumber,
    this.floorNumber,
    this.apartmentNumber,
    this.houseNumber,
    this.officeNumber,
    this.notes,
    this.createdAt,
    this.fullName,
    this.flatNumber,
    this.mobileNumber,
    this.extraDirections,
    this.area,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        addressName: json["address_name"],
        areaId: json["area_id"],
        block: json["block"],
        street: json["street"],
        avenue: json["avenue"],
        type: json["type"],
        buildingNumber: json["building_number"],
        floorNumber: json["floor_number"],
        apartmentNumber: json["apartment_number"],
        houseNumber: json["house_number"],
        officeNumber: json["office_number"],
        notes: json["notes"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        fullName: json["full_name"],
        flatNumber: json["flat_number"],
        mobileNumber: json["mobile_number"],
        extraDirections: json["extra_directions"],
        area: json["area"] == null ? null : Area.fromJson(json["area"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "address_name": addressName,
        "area_id": areaId,
        "block": block,
        "street": street,
        "avenue": avenue,
        "type": type,
        "building_number": buildingNumber,
        "floor_number": floorNumber,
        "apartment_number": apartmentNumber,
        "house_number": houseNumber,
        "office_number": officeNumber,
        "notes": notes,
        "created_at": createdAt?.toIso8601String(),
        "full_name": fullName,
        "flat_number": flatNumber,
        "mobile_number": mobileNumber,
        "extra_directions": extraDirections,
        "area": area?.toJson(),
      };
}

class Area {
  int? id;
  int? deliveryCost;
  dynamic countryId;
  String? status;
  DateTime? createdAt;
  String? name;

  Area({
    this.id,
    this.deliveryCost,
    this.countryId,
    this.status,
    this.createdAt,
    this.name,
  });

  factory Area.fromRawJson(String str) => Area.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        deliveryCost: json["delivery_cost"],
        countryId: json["country_id"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "delivery_cost": deliveryCost,
        "country_id": countryId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "name": name,
      };
}

class ProductElement {
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  int? discount;
  int? price;
  int? offerPrice;
  int? variantId;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  ProductProduct? product;

  ProductElement({
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.discount,
    this.price,
    this.offerPrice,
    this.variantId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.product,
  });

  factory ProductElement.fromRawJson(String str) =>
      ProductElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        discount: json["discount"],
        price: json["price"],
        offerPrice: json["offer_price"],
        variantId: json["variant_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        product: json["product"] == null
            ? null
            : ProductProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "discount": discount,
        "price": price,
        "offer_price": offerPrice,
        "variant_id": variantId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "product": product?.toJson(),
      };
}

class ProductProduct {
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
  List<Variant>? variants;

  ProductProduct({
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

  factory ProductProduct.fromRawJson(String str) =>
      ProductProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
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
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Color? color;
  Color? size;

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
    this.color,
    this.size,
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
        color: json["color"] == null ? null : Color.fromJson(json["color"]),
        size: json["size"] == null ? null : Color.fromJson(json["size"]),
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
        "color": color?.toJson(),
        "size": size?.toJson(),
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
