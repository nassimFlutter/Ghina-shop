class CategoryResponse {
  final String? status;
  final String? message;
  final Data? data;
  final dynamic errors;
  const CategoryResponse({this.status, this.message, this.data, this.errors});
  CategoryResponse copyWith(
      {String? status, String? message, Data? data, dynamic? errors}) {
    return CategoryResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        errors: errors ?? this.errors);
  }

  Map<String, Object?> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
      'errors': errors
    };
  }

  static CategoryResponse fromJson(Map<String, Object?> json) {
    return CategoryResponse(
        status: json['status'] == null ? null : json['status'] as String,
        message: json['message'] == null ? null : json['message'] as String,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, Object?>),
        errors: json['errors'] as dynamic);
  }

  @override
  String toString() {
    return '''CategoryResponse(
                status:$status,
message:$message,
data:${data.toString()},
errors:$errors
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryResponse &&
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
  final List<Categories>? categories;
  final Pagination? pagination;
  const Data({this.categories, this.pagination});
  Data copyWith({List<Categories>? categories, Pagination? pagination}) {
    return Data(
        categories: categories ?? this.categories,
        pagination: pagination ?? this.pagination);
  }

  Map<String, Object?> toJson() {
    return {
      'categories': categories
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'pagination': pagination?.toJson()
    };
  }

  static Data fromJson(Map<String, Object?> json) {
    return Data(
        categories: json['categories'] == null
            ? null
            : (json['categories'] as List)
                .map<Categories>(
                    (data) => Categories.fromJson(data as Map<String, Object?>))
                .toList(),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''Data(
                categories:${categories.toString()},
pagination:${pagination.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Data &&
        other.runtimeType == runtimeType &&
        other.categories == categories &&
        other.pagination == pagination;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, categories, pagination);
  }
}

class Pagination {
  final int? limit;
  final int? numberOfPages;
  final dynamic next;
  final dynamic prev;
  const Pagination({this.limit, this.numberOfPages, this.next, this.prev});
  Pagination copyWith(
      {int? limit, int? numberOfPages, dynamic? next, dynamic? prev}) {
    return Pagination(
        limit: limit ?? this.limit,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        next: next ?? this.next,
        prev: prev ?? this.prev);
  }

  Map<String, Object?> toJson() {
    return {
      'limit': limit,
      'numberOfPages': numberOfPages,
      'next': next,
      'prev': prev
    };
  }

  static Pagination fromJson(Map<String, Object?> json) {
    return Pagination(
        limit: json['limit'] == null ? null : json['limit'] as int,
        numberOfPages:
            json['numberOfPages'] == null ? null : json['numberOfPages'] as int,
        next: json['next'] as dynamic,
        prev: json['prev'] as dynamic);
  }

  @override
  String toString() {
    return '''Pagination(
                limit:$limit,
numberOfPages:$numberOfPages,
next:$next,
prev:$prev
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Pagination &&
        other.runtimeType == runtimeType &&
        other.limit == limit &&
        other.numberOfPages == numberOfPages &&
        other.next == next &&
        other.prev == prev;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, limit, numberOfPages, next, prev);
  }
}

class Categories {
  final int? id;
  final String? image;
  final bool? featured;
  final String? status;
  final String? createdAt;
  final String? name;
  const Categories(
      {this.id,
      this.image,
      this.featured,
      this.status,
      this.createdAt,
      this.name});
  Categories copyWith(
      {int? id,
      String? image,
      bool? featured,
      String? status,
      String? createdAt,
      String? name}) {
    return Categories(
        id: id ?? this.id,
        image: image ?? this.image,
        featured: featured ?? this.featured,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'image': image,
      'featured': featured,
      'status': status,
      'created_at': createdAt,
      'name': name
    };
  }

  static Categories fromJson(Map<String, Object?> json) {
    return Categories(
        id: json['id'] == null ? null : json['id'] as int,
        image: json['image'] == null ? null : json['image'] as String,
        featured: json['featured'] == null ? null : json['featured'] as bool,
        status: json['status'] == null ? null : json['status'] as String,
        createdAt:
            json['created_at'] == null ? null : json['created_at'] as String,
        name: json['name'] == null ? null : json['name'] as String);
  }

  @override
  String toString() {
    return '''Categories(
                id:$id,
image:$image,
featured:$featured,
status:$status,
createdAt:$createdAt,
name:$name
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Categories &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.image == image &&
        other.featured == featured &&
        other.status == status &&
        other.createdAt == createdAt &&
        other.name == name;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, image, featured, status, createdAt, name);
  }
}
