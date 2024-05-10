import 'dart:convert';

class AddAndRemoveFromFavoriteResponse {
    bool? status;
    int? code;
    String? message;
    String? operation;

    AddAndRemoveFromFavoriteResponse({
        this.status,
        this.code,
        this.message,
        this.operation,
    });

    factory AddAndRemoveFromFavoriteResponse.fromRawJson(String str) => AddAndRemoveFromFavoriteResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddAndRemoveFromFavoriteResponse.fromJson(Map<String, dynamic> json) => AddAndRemoveFromFavoriteResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        operation: json["operation"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "operation": operation,
    };
}
