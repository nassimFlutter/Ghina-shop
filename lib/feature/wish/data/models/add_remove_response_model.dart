class AddAndRemoveFromFavoriteResponse {
  final String? status;
  final String? message;
  final Data? data;
  final dynamic errors;
  const AddAndRemoveFromFavoriteResponse(
      {this.status, this.message, this.data, this.errors});
  AddAndRemoveFromFavoriteResponse copyWith(
      {String? status, String? message, Data? data, dynamic? errors}) {
    return AddAndRemoveFromFavoriteResponse(
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

  static AddAndRemoveFromFavoriteResponse fromJson(Map<String, Object?> json) {
    return AddAndRemoveFromFavoriteResponse(
        status: json['status'] == null ? null : json['status'] as String,
        message: json['message'] == null ? null : json['message'] as String,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, Object?>),
        errors: json['errors'] as dynamic);
  }

  @override
  String toString() {
    return '''AddAndRemoveFromFavoriteResponse(
                status:$status,
message:$message,
data:${data.toString()},
errors:$errors
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is AddAndRemoveFromFavoriteResponse &&
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
  final String? message;
  final String? operation;
  const Data({this.message, this.operation});
  Data copyWith({String? message, String? operation}) {
    return Data(
        message: message ?? this.message,
        operation: operation ?? this.operation);
  }

  Map<String, Object?> toJson() {
    return {'message': message, 'operation': operation};
  }

  static Data fromJson(Map<String, Object?> json) {
    return Data(
        message: json['message'] == null ? null : json['message'] as String,
        operation:
            json['operation'] == null ? null : json['operation'] as String);
  }

  @override
  String toString() {
    return '''Data(
                message:$message,
operation:$operation
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Data &&
        other.runtimeType == runtimeType &&
        other.message == message &&
        other.operation == operation;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, message, operation);
  }
}
