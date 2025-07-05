class UserInfoResponse {
  final String status;
  final String message;
  final UserInfo? data;
  final dynamic errors;

  UserInfoResponse({
    required this.status,
    required this.message,
    this.data,
    this.errors,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) {
    return UserInfoResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: json['data'] != null ? UserInfo.fromJson(json['data']) : null,
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
      'errors': errors,
    };
  }
}

class UserInfo {
  final int id;
  final String name;
  final String email;
  final String mobile;
  final String? image;
  final bool isAdmin;
  final bool wholeSellbuyer;
  final String? socialType;
  final String status;
  final String createdAt;
  final String updatedAt;
  final List<AdminRole> adminRoles;
  final bool isSeller;

  UserInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    this.image,
    required this.isAdmin,
    required this.wholeSellbuyer,
    this.socialType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.adminRoles,
    required this.isSeller,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      image: json['image'],
      isAdmin: json['is_admin'] ?? false,
      wholeSellbuyer: json['wholeSellbuyer'] ?? false,
      socialType: json['social_type'],
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      adminRoles: (json['adminRoles'] as List<dynamic>?)
              ?.map((role) => AdminRole.fromJson(role))
              .toList() ??
          [],
      isSeller: json['isSeller'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'image': image,
      'is_admin': isAdmin,
      'wholeSellbuyer': wholeSellbuyer,
      'social_type': socialType,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'adminRoles': adminRoles.map((role) => role.toJson()).toList(),
      'isSeller': isSeller,
    };
  }

  // Helper methods
  bool get hasImage => image != null && image!.isNotEmpty;
  bool get isActive => status.toLowerCase() == 'active';

  // Copy with method for immutable updates
  UserInfo copyWith({
    int? id,
    String? name,
    String? email,
    String? mobile,
    String? image,
    bool? isAdmin,
    bool? wholeSellbuyer,
    String? socialType,
    String? status,
    String? createdAt,
    String? updatedAt,
    List<AdminRole>? adminRoles,
    bool? isSeller,
  }) {
    return UserInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      image: image ?? this.image,
      isAdmin: isAdmin ?? this.isAdmin,
      wholeSellbuyer: wholeSellbuyer ?? this.wholeSellbuyer,
      socialType: socialType ?? this.socialType,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      adminRoles: adminRoles ?? this.adminRoles,
      isSeller: isSeller ?? this.isSeller,
    );
  }
}

class AdminRole {
  final int id;
  final int roleId;
  final Role role;

  AdminRole({
    required this.id,
    required this.roleId,
    required this.role,
  });

  factory AdminRole.fromJson(Map<String, dynamic> json) {
    return AdminRole(
      id: json['id'] ?? 0,
      roleId: json['roleId'] ?? 0,
      role: Role.fromJson(json['role'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roleId': roleId,
      'role': role.toJson(),
    };
  }
}

class Role {
  final int id;
  final String slug;

  Role({
    required this.id,
    required this.slug,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'] ?? 0,
      slug: json['slug'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
    };
  }
}
