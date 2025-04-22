import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/utils/keys.dart';

class UserModel {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? mobile;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.mobile,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
      'mobile': mobile,
    };
    //! Remove null values from the map
    data.removeWhere((key, value) => value == null);
    return data;
  }

  @override
  String toString() {
    return 'Name: $name\nEmail: $email\nPassword: $password\nConfirm Password: $confirmPassword\nMobile: $mobile';
  }
}

//! cached User
Future<void> cacheUserInfo(Map<String, dynamic> userInfo) async {
  if (userInfo['name'] != null) {
    await CacheHelper.setData(key: Keys.kUserName, value: userInfo['name']);
  }
  if (userInfo['email'] != null) {
    await CacheHelper.setData(key: Keys.kUserEmail, value: userInfo['email']);
  }
  if (userInfo['mobile'] != null) {
    await CacheHelper.setData(key: Keys.kUserMobile, value: userInfo['mobile']);
  }
  if (userInfo['access_token'] != null) {
   
  }
}
