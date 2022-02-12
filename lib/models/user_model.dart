class User {
  int? id;
  String? password;
  String? fullname;
  String? email;
  String? number;
  String? tokens;

  User({
    this.id,
    this.password,
    this.fullname,
    this.email,
    this.number,
    this.tokens,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tokens = json['tokens']['access'];
    fullname = json['fullname'];
    email = json['email'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tokens'] = tokens;
    data['fullname'] = fullname;
    data['email'] = email;
    data['number'] = number;
    return data;
  }
}

//shipping address
class ShippingAddress {
  int? id;
  String? country;
  String? city;
  String? address;
  bool? isActive;
  User? user;

  ShippingAddress({
    this.id,
    this.country,
    this.city,
    this.address,
    this.isActive,
    this.user,
  });

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    isActive = json['is_active'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country'] = country;
    data['city'] = city;
    data['address'] = address;
    data['is_active'] = isActive;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
