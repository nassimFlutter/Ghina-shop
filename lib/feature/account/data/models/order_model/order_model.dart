class OrderModel {
  final String? status;
  final String? message;
  final Data? data;
  final dynamic errors;
  const OrderModel({this.status, this.message, this.data, this.errors});
  OrderModel copyWith(
      {String? status, String? message, Data? data, dynamic? errors}) {
    return OrderModel(
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

  static OrderModel fromJson(Map<String, Object?> json) {
    return OrderModel(
        status: json['status'] == null ? null : json['status'] as String,
        message: json['message'] == null ? null : json['message'] as String,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, Object?>),
        errors: json['errors'] as dynamic);
  }

  @override
  String toString() {
    return '''OrderModel(
                status:$status,
message:$message,
data:${data.toString()},
errors:$errors
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is OrderModel &&
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
  final List<Orders>? orders;
  final Pagination? pagination;
  const Data({this.orders, this.pagination});
  Data copyWith({List<Orders>? orders, Pagination? pagination}) {
    return Data(
        orders: orders ?? this.orders,
        pagination: pagination ?? this.pagination);
  }

  Map<String, Object?> toJson() {
    return {
      'orders':
          orders?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'pagination': pagination?.toJson()
    };
  }

  static Data fromJson(Map<String, Object?> json) {
    return Data(
        orders: json['orders'] == null
            ? null
            : (json['orders'] as List)
                .map<Orders>(
                    (data) => Orders.fromJson(data as Map<String, Object?>))
                .toList(),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''Data(
                orders:${orders.toString()},
pagination:${pagination.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Data &&
        other.runtimeType == runtimeType &&
        other.orders == orders &&
        other.pagination == pagination;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, orders, pagination);
  }
}

class Pagination {
  final String? currentPage;
  final int? limit;
  final int? numberOfPages;
  final dynamic next;
  final dynamic prev;
  const Pagination(
      {this.currentPage, this.limit, this.numberOfPages, this.next, this.prev});
  Pagination copyWith(
      {String? currentPage,
      int? limit,
      int? numberOfPages,
      dynamic? next,
      dynamic? prev}) {
    return Pagination(
        currentPage: currentPage ?? this.currentPage,
        limit: limit ?? this.limit,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        next: next ?? this.next,
        prev: prev ?? this.prev);
  }

  Map<String, Object?> toJson() {
    return {
      'currentPage': currentPage,
      'limit': limit,
      'numberOfPages': numberOfPages,
      'next': next,
      'prev': prev
    };
  }

  static Pagination fromJson(Map<String, Object?> json) {
    return Pagination(
      currentPage: json['currentPage']?.toString(),
      limit: json['limit'] == null ? null : json['limit'] as int,
      numberOfPages:
          json['numberOfPages'] == null ? null : json['numberOfPages'] as int,
      next: json['next'],
      prev: json['prev'],
    );
  }

  @override
  String toString() {
    return '''Pagination(
                currentPage:$currentPage,
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
        other.currentPage == currentPage &&
        other.limit == limit &&
        other.numberOfPages == numberOfPages &&
        other.next == next &&
        other.prev == prev;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, currentPage, limit, numberOfPages, next, prev);
  }
}

class Orders {
  final int? id;
  final int? status;
  final String? orderedDate;
  final String? deliveryDate;
  final String? discount;
  final num? deliveryCost;
  final String? shippingAddress;
  final String? discountCode;
  final String? cancelNote;
  final num? totalPrice;
  final num? countItems;
  final List<Products>? products;
  const Orders(
      {this.id,
      this.status,
      this.orderedDate,
      this.deliveryDate,
      this.discount,
      this.deliveryCost,
      this.shippingAddress,
      this.discountCode,
      this.totalPrice,
      this.cancelNote,
      this.countItems,
      this.products});
  Orders copyWith(
      {int? id,
      int? status,
      String? orderedDate,
      String? discount,
      int? deliveryCost,
      String? shippingAddress,
      String? discountCode,
      int? totalPrice,
      int? countItems,
      List<Products>? products}) {
    return Orders(
        id: id ?? this.id,
        status: status ?? this.status,
        orderedDate: orderedDate ?? this.orderedDate,
        discount: discount ?? this.discount,
        deliveryCost: deliveryCost ?? this.deliveryCost,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        discountCode: discountCode ?? this.discountCode,
        totalPrice: totalPrice ?? this.totalPrice,
        countItems: countItems ?? this.countItems,
        products: products ?? this.products);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'status': status,
      'ordered_date': orderedDate,
      'discount': discount,
      'delivery_cost': deliveryCost,
      'shipping_address': shippingAddress,
      'discount_code': discountCode,
      'total_price': totalPrice,
      'count_items': countItems,
      'products':
          products?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static Orders fromJson(Map<String, Object?> json) {
    return Orders(
        id: json['id'] == null ? null : json['id'] as int,
        status: json['status'] == null ? null : json['status'] as int,
        orderedDate: json['ordered_date'] == null
            ? null
            : json['ordered_date'] as String,
        deliveryDate: json['delivery_date'] == null
            ? null
            : json['delivery_date'] as String,
        discount: json['discount'] == null ? null : json['discount'] as String,
        deliveryCost:
            json['delivery_cost'] == null ? null : json['delivery_cost'] as num,
        shippingAddress: json['shipping_address'] == null
            ? null
            : json['shipping_address'] as String,
        discountCode: json['discount_code'] == null
            ? null
            : json['discount_code'] as String,
        cancelNote:
            json['cancel_note'] == null ? null : json["cancel_note"] as String,
        totalPrice:
            json['total_price'] == null ? null : json['total_price'] as num,
        countItems:
            json['count_items'] == null ? null : json['count_items'] as num,
        products: json['products'] == null
            ? null
            : (json['products'] as List)
                .map<Products>(
                    (data) => Products.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''Orders(
                id:$id,
status:$status,
orderedDate:$orderedDate,
discount:$discount,
deliveryCost:$deliveryCost,
shippingAddress:$shippingAddress,
discountCode:$discountCode,
totalPrice:$totalPrice,
countItems:$countItems,
products:${products.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Orders &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.status == status &&
        other.orderedDate == orderedDate &&
        other.discount == discount &&
        other.deliveryCost == deliveryCost &&
        other.shippingAddress == shippingAddress &&
        other.discountCode == discountCode &&
        other.totalPrice == totalPrice &&
        other.countItems == countItems &&
        other.products == products;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        status,
        orderedDate,
        discount,
        deliveryCost,
        shippingAddress,
        discountCode,
        totalPrice,
        countItems,
        products);
  }
}

class Products {
  final int? id;
  final String? name;
  final int? price;
  final int? quantity;
  const Products({this.id, this.name, this.price, this.quantity});
  Products copyWith({int? id, String? name, int? price, int? quantity}) {
    return Products(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'name': name, 'price': price, 'quantity': quantity};
  }

  static Products fromJson(Map<String, Object?> json) {
    return Products(
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        price: json['price'] == null ? null : json['price'] as int,
        quantity: json['quantity'] == null ? null : json['quantity'] as int);
  }

  @override
  String toString() {
    return '''Products(
                id:$id,
name:$name,
price:$price,
quantity:$quantity
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Products &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, price, quantity);
  }
}
