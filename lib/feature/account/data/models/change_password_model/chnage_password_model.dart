import 'dart:convert';

class ChangePasswordModel {
    String oldPassword;
    String password;
    String confirmPassword;

    ChangePasswordModel({
        required this.oldPassword,
        required this.password,
        required this.confirmPassword,
    });

    factory ChangePasswordModel.fromRawJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
        oldPassword: json["old_password"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
    );

    Map<String, dynamic> toJson() => {
        "old_password": oldPassword,
        "password": password,
        "confirm_password": confirmPassword,
    };
}
