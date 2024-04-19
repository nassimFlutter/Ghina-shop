import 'dart:convert';

class Response {
    bool status;
    int? code;
    String? message;

    Response({
        required this.status,
        this.code,
        this.message,
    });

    factory Response.fromRawJson(String str) => Response.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        status: json["status"],
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
    };
}
