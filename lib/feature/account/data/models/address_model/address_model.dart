import 'dart:convert';

class AddressModel {
  bool? status;
  int? code;
  String? message;
  List<Item>? items;
  bool? isMore;

  AddressModel({
    this.status,
    this.code,
    this.message,
    this.items,
    this.isMore,
  });

  factory AddressModel.fromRawJson(String str) =>
      AddressModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        isMore: json["is_more"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "is_more": isMore,
      };
}

class Item {
  int? id;
  int? userId;
  String? addressName;
  int? areaId;
  String? block;
  String? street;
  dynamic avenue;
  int? type;
  dynamic buildingNumber;
  dynamic floorNumber;
  dynamic apartmentNumber;
  dynamic houseNumber;
  dynamic officeNumber;
  dynamic notes;
  Area? area;

  Item({
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
    this.area,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] ?? -1,
        userId: json["user_id"] ?? "",
        addressName: json["address_name"] ?? "",
        areaId: json["area_id"] ?? "",
        block: json["block"] ?? "",
        street: json["street"] ?? "",
        avenue: json["avenue"] ?? "",
        type: json["type"] ?? 0,
        buildingNumber: json["building_number"] ?? "",
        floorNumber: json["floor_number"] ?? "",
        apartmentNumber: json["apartment_number"] ?? '',
        houseNumber: json["house_number"] ?? "",
        officeNumber: json["office_number"] ?? "",
        notes: json["notes"] ?? "",
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
