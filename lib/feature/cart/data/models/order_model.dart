class OrderModel {
  final String shippingAddress;
  final String name;
  final String mobile;
  final String email;
  final List<OrderItem> items;

  OrderModel({
    required this.shippingAddress,
    required this.name,
    required this.mobile,
    required this.email,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      "shipping_address": shippingAddress,
      "name": name,
      "mobile": mobile,
      "email": email,
      "items": items.map((item) => item.toJson()).toList(),
    };
  }
}

class OrderItem {
  final int productId;
  final int quantity;

  OrderItem({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "quantity": quantity,
    };
  }
}
