class NewsResponseModel {
  final String? status;
  final String? message;
  final List<Data>? data;
  final dynamic errors;
  const NewsResponseModel({this.status, this.message, this.data, this.errors});
  NewsResponseModel copyWith(
      {String? status, String? message, List<Data>? data, dynamic? errors}) {
    return NewsResponseModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        errors: errors ?? this.errors);
  }

  Map<String, Object?> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'errors': errors
    };
  }

  static NewsResponseModel fromJson(Map<String, Object?> json) {
    return NewsResponseModel(
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
    return '''NewsResponseModel(
                status:$status,
message:$message,
data:${data.toString()},
errors:$errors
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is NewsResponseModel &&
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
  final String? content;
  const Data({this.id, this.content});
  Data copyWith({int? id, String? content}) {
    return Data(id: id ?? this.id, content: content ?? this.content);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'content': content};
  }

  static Data fromJson(Map<String, Object?> json) {
    return Data(
        id: json['id'] == null ? null : json['id'] as int,
        content: json['content'] == null ? null : json['content'] as String);
  }

  @override
  String toString() {
    return '''Data(
                id:$id,
content:$content
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Data &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.content == content;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, content);
  }
}
