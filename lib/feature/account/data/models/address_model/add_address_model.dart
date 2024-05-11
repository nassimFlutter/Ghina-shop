class AddAddressModel {
  String? fullName;
  String? flatNumber;
  String? mobileNumber;
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
  AddAddressModel({
    this.fullName,
    this.flatNumber,
    this.mobileNumber,
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
  });
  factory AddAddressModel.fromJson(Map<String, dynamic> json) =>
      AddAddressModel(
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
      );
  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "flat_number": flatNumber,
        "mobile_number":mobileNumber,
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
      };
}
