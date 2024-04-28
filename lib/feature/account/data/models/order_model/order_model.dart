import 'dart:convert';

class OrderModel {
    bool? status;
    int? code;
    String? message;
    List<AllOrder>? items;
    bool? isMore;
    List<AllOrder>? allOrders;

    OrderModel({
        this.status,
        this.code,
        this.message,
        this.items,
        this.isMore,
        this.allOrders,
    });

    factory OrderModel.fromRawJson(String str) => OrderModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        items: json["items"] == null ? [] : List<AllOrder>.from(json["items"]!.map((x) => AllOrder.fromJson(x))),
        isMore: json["is_more"],
        allOrders: json["allOrders"] == null ? [] : List<AllOrder>.from(json["allOrders"]!.map((x) => AllOrder.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "is_more": isMore,
        "allOrders": allOrders == null ? [] : List<dynamic>.from(allOrders!.map((x) => x.toJson())),
    };
}

class AllOrder {
    int? id;
    dynamic pnmId;
    int? userId;
    int? totalPrice;
    int? totalCommissionAmount;
    int? addressId;
    dynamic discount;
    int? deliveryCost;
    String? discountCode;
    int? subTotal;
    int? countItems;
    String? name;
    String? email;
    String? mobile;
    dynamic paymentId;
    dynamic transactionId;
    dynamic paymentJson;
    dynamic paymentCheckResponse;
    int? paymentMethod;
    String? paymentToken;
    int? paymentStatus;
    int? status;
    int? cancelType;
    dynamic refundId;
    dynamic refundReference;
    DateTime? orderedDate;
    DateTime? createdAt;
    String? statusName;

    AllOrder({
        this.id,
        this.pnmId,
        this.userId,
        this.totalPrice,
        this.totalCommissionAmount,
        this.addressId,
        this.discount,
        this.deliveryCost,
        this.discountCode,
        this.subTotal,
        this.countItems,
        this.name,
        this.email,
        this.mobile,
        this.paymentId,
        this.transactionId,
        this.paymentJson,
        this.paymentCheckResponse,
        this.paymentMethod,
        this.paymentToken,
        this.paymentStatus,
        this.status,
        this.cancelType,
        this.refundId,
        this.refundReference,
        this.orderedDate,
        this.createdAt,
        this.statusName,
    });

    factory AllOrder.fromRawJson(String str) => AllOrder.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AllOrder.fromJson(Map<String, dynamic> json) => AllOrder(
        id: json["id"],
        pnmId: json["PNM_ID"],
        userId: json["user_id"],
        totalPrice: json["total_price"],
        totalCommissionAmount: json["total_commission_amount"],
        addressId: json["address_id"],
        discount: json["discount"],
        deliveryCost: json["delivery_cost"],
        discountCode: json["discount_code"],
        subTotal: json["sub_total"],
        countItems: json["count_items"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        paymentId: json["payment_id"],
        transactionId: json["transaction_id"],
        paymentJson: json["payment_json"],
        paymentCheckResponse: json["payment_check_response"],
        paymentMethod: json["payment_method"],
        paymentToken: json["payment_token"],
        paymentStatus: json["payment_status"],
        status: json["status"],
        cancelType: json["cancel_type"],
        refundId: json["refund_id"],
        refundReference: json["refund_reference"],
        orderedDate: json["ordered_date"] == null ? null : DateTime.parse(json["ordered_date"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        statusName: json["status_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "PNM_ID": pnmId,
        "user_id": userId,
        "total_price": totalPrice,
        "total_commission_amount": totalCommissionAmount,
        "address_id": addressId,
        "discount": discount,
        "delivery_cost": deliveryCost,
        "discount_code": discountCode,
        "sub_total": subTotal,
        "count_items": countItems,
        "name": name,
        "email": email,
        "mobile": mobile,
        "payment_id": paymentId,
        "transaction_id": transactionId,
        "payment_json": paymentJson,
        "payment_check_response": paymentCheckResponse,
        "payment_method": paymentMethod,
        "payment_token": paymentToken,
        "payment_status": paymentStatus,
        "status": status,
        "cancel_type": cancelType,
        "refund_id": refundId,
        "refund_reference": refundReference,
        "ordered_date": orderedDate?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "status_name": statusName,
    };
}
