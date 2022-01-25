import 'category_model.dart';

class Product {
  int? id;
  String? slug;
  String? image;
  String? title;
  String? description;
  int? quantity;
  String? price;
  String? discountPrice;
  String? sizeTyoe;
  bool? isActive;
  Colorlabel? colorlabel;
  List<Category>? category;

  Product({
    this.id,
    this.slug,
    this.image,
    this.title,
    this.description,
    this.quantity,
    this.price,
    this.discountPrice,
    this.sizeTyoe,
    this.isActive,
    this.colorlabel,
    this.category,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    discountPrice = json['discount_price'];
    sizeTyoe = json['size_tyoe'];
    isActive = json['is_active'];
    colorlabel = json['colorlabel'] != null
        ? Colorlabel.fromJson(json['colorlabel'])
        : null;
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['size_tyoe'] = sizeTyoe;
    data['is_active'] = isActive;
    if (colorlabel != null) {
      data['colorlabel'] = colorlabel!.toJson();
    }
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

//Color Class
class Colorlabel {
  int? id;
  String? title;
  String? haxCode;

  Colorlabel({this.id, this.title, this.haxCode});

  Colorlabel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    haxCode = json['hax_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['hax_code'] = haxCode;
    return data;
  }
}


List<Product> prod_list = [];
