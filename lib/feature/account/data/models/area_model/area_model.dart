import 'dart:convert';

class AreaModel {
    bool? status;
    int? code;
    String? message;
    List<Item>? items;

    AreaModel({
        this.status,
        this.code,
        this.message,
        this.items,
    });

    factory AreaModel.fromRawJson(String str) => AreaModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    int? id;
    int? deliveryCost;
    dynamic countryId;
    String? status;
    DateTime? createdAt;
    String? name;

    Item({
        this.id,
        this.deliveryCost,
        this.countryId,
        this.status,
        this.createdAt,
        this.name,
    });

    factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        deliveryCost: json["delivery_cost"],
        countryId: json["country_id"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
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
