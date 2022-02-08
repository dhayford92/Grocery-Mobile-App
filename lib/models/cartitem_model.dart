import 'product_model.dart';
import 'user_model.dart';


/*

 cart item model

*/
class CartItem {
  int? id;
  int? quantity;
  double? totalPrice;
  bool? isOrdered;
  String? created;
  User? user;
  Product? product;

  CartItem({
    this.id,
    this.quantity,
    this.totalPrice,
    this.isOrdered,
    this.created,
    this.user,
    this.product,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    isOrdered = json['is_ordered'];
    created = json['created'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['total_price'] = totalPrice;
    data['is_ordered'] = isOrdered;
    data['created'] = created;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
