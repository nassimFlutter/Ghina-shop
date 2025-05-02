class StoreResponse {
  final String? status;
  final String? message;
  final List<Data>? data;
  final dynamic errors;
  const StoreResponse({this.status, this.message, this.data, this.errors});
  StoreResponse copyWith(
      {String? status, String? message, List<Data>? data, dynamic? errors}) {
    return StoreResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        errors: errors ?? this.errors);
  }

  static StoreResponse fromJson(Map<String, Object?> json) {
    return StoreResponse(
        status: json['status'] == null ? null : json['status'] as String,
        message: json['message'] == null ? null : json['message'] as String,
        data: json['data'] == null
            ? null
            : (json['data'] as List)
                .map<Data>(
                    (data) => Data.fromJson(data as Map<String, Object?>))
                .toList(),
        errors: json['errors'] as dynamic);
  }

  @override
  String toString() {
    return '''StoreResponse(
                status:$status,
message:$message,
data:${data.toString()},
errors:$errors
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is StoreResponse &&
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
  final String? name;
  final String? email;
  final String? image;
  final String? mobile;
  final bool? isAdmin;

  final String? status;
  final String? createdAt;
  final String? updatedAt;

  final List<AdminRoles>? adminRoles;
  const Data(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.mobile,
      this.isAdmin,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.adminRoles});
  Data copyWith(
      {int? id,
      String? name,
      String? email,
      String? image,
      String? mobile,
      bool? isAdmin,
      String? status,
      String? createdAt,
      String? updatedAt,
      List<AdminRoles>? adminRoles}) {
    return Data(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        image: image ?? this.image,
        mobile: mobile ?? this.mobile,
        isAdmin: isAdmin ?? this.isAdmin,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        adminRoles: adminRoles ?? this.adminRoles);
  }

  static Data fromJson(Map<String, Object?> json) {
    return Data(
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        image: json['image'] == null ? null : json['image'] as String,
        mobile: json['mobile'] == null ? null : json['mobile'] as String,
        isAdmin: json['is_admin'] == null ? null : json['is_admin'] as bool,
        status: json['status'] == null ? null : json['status'] as String,
        createdAt:
            json['created_at'] == null ? null : json['created_at'] as String,
        updatedAt:
            json['updated_at'] == null ? null : json['updated_at'] as String,
        adminRoles: json['adminRoles'] == null
            ? null
            : (json['adminRoles'] as List)
                .map<AdminRoles>(
                    (data) => AdminRoles.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''Data(
                id:$id,
name:$name,
email:$email,
image:$image,
mobile:$mobile,
isAdmin:$isAdmin,

status:$status,
createdAt:$createdAt,
updatedAt:$updatedAt,

adminRoles:${adminRoles.toString()}
    ) ''';
  }
}

class AdminRoles {
  final int? id;
  final Role? role;
  const AdminRoles({this.id, this.role});
  AdminRoles copyWith({int? id, Role? role}) {
    return AdminRoles(id: id ?? this.id, role: role ?? this.role);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'role': role?.toJson()};
  }

  static AdminRoles fromJson(Map<String, Object?> json) {
    return AdminRoles(
        id: json['id'] == null ? null : json['id'] as int,
        role: json['role'] == null
            ? null
            : Role.fromJson(json['role'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''AdminRoles(
                id:$id,
role:${role.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is AdminRoles &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.role == role;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, role);
  }
}

class Role {
  final int? id;
  final String? slug;
  const Role({this.id, this.slug});
  Role copyWith({int? id, String? slug}) {
    return Role(id: id ?? this.id, slug: slug ?? this.slug);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'slug': slug};
  }

  static Role fromJson(Map<String, Object?> json) {
    return Role(
        id: json['id'] == null ? null : json['id'] as int,
        slug: json['slug'] == null ? null : json['slug'] as String);
  }

  @override
  String toString() {
    return '''Role(
                id:$id,
slug:$slug
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Role &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.slug == slug;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, slug);
  }
}
