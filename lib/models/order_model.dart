// ignore_for_file: constant_identifier_names

import 'product_model.dart';
import 'user_model.dart';

//order type
enum OrderType { PickUp, Delivery }

//order status
enum OrderStatus { Pending, Confirmed, Cancelled, Delivered, Refund }

//order model
class Order {
  int? id;
  String? orderID;
  String? total;
  String? paymentType;
  String? orderType;
  String? orderStatus;
  String? note;
  bool? isOrdered;
  String? created;
  String? updated;
  User? user;
  Coupon? coupon;
  ShippingAddress? shippingTo;
  List<Product>? items;

  Order({
    this.id,
    this.orderID,
    this.total,
    this.paymentType,
    this.orderType,
    this.orderStatus,
    this.note,
    this.isOrdered,
    this.created,
    this.updated,
    this.user,
    this.coupon,
    this.shippingTo,
    this.items,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderID = json['orderID'];
    total = json['total'];
    paymentType = json['payment_type'];
    orderType = json['order_type'];
    orderStatus = json['order_status'];
    note = json['note'];
    isOrdered = json['is_ordered'];
    created = json['created'];
    updated = json['updated'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    coupon = json['coupon'] != null ? Coupon.fromJson(json['coupon']) : null;
    shippingTo = json['shipping_to'] != null
        ? ShippingAddress.fromJson(json['shipping_to'])
        : null;
    if (json['items'] != null) {
      items = <Product>[];
      json['items'].forEach((v) {
        items!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderID'] = orderID;
    data['total'] = total;
    data['payment_type'] = paymentType;
    data['order_type'] = orderType;
    data['order_status'] = orderStatus;
    data['note'] = note;
    data['is_ordered'] = isOrdered;
    data['created'] = created;
    data['updated'] = updated;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
    if (shippingTo != null) {
      data['shipping_to'] = shippingTo!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

//coupon model
class Coupon {
  int? id;
  String? title;
  String? price;
  bool? isActive;

  Coupon({
    this.id,
    this.title,
    this.price,
    this.isActive,
  });

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['is_active'] = isActive;
    return data;
  }
}
