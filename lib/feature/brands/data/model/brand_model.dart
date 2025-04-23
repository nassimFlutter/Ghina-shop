class BrandResponse {
  bool? status;
  int? code;
  String? message;
  List<Brand>? items;

  BrandResponse({
    this.status,
    this.code,
    this.message,
    this.items,
  });

  factory BrandResponse.fromJson(Map<String, dynamic> json) {
    return BrandResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      items:
          List<Brand>.from(json['items'].map((item) => Brand.fromJson(item))),
    );
  }
}

class Brand {
  Brand();
  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand();
  }
}
