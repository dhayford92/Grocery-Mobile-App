


import 'category_model.dart';

class Product {
  int? id;
  String? slug;
  String? image;
  String? title;
  String? description;
  int? quantity;
  double? price;
  double? discountPrice;
  String? sizeType;
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
    this.sizeType,
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
    sizeType = json['size_tyoe'];
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
    data['size_tyoe'] = sizeType;
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




//list of product
Colorlabel? colour;

List<Product> prod_list = [
  Product(
    id: 0,
    title: 'Apple',
    category: cate_list,
    price: 12.00,
    colorlabel: colour,
    discountPrice: 0.00,
    image: 'assets/images/fruit.jpg',
    isActive: true
    ),
  Product(
    id: 1,
    title: 'Banana',
    category: cate_list,
    price: 12.00,
    discountPrice: 10.00,
    colorlabel: colour,
    image: 'assets/images/fruit.jpg',
    isActive: false
  ),
  Product(
    id: 2,
    title: 'Pear',
    category: cate_list,
    price: 12.00,
    discountPrice: 0.00,
    colorlabel: colour,
    image: 'assets/images/fruit.jpg',
    isActive: true
  ),
  Product(
    id: 3,
    title: 'Mango',
    category: cate_list,
    price: 12.00,
    discountPrice: 8.00,
    colorlabel: colour,
    image: 'assets/images/fruit.jpg',
    isActive: false
  ),
  Product(
    id: 4,
    title: 'Tomato',
    category: cate_list,
    price: 15.00,
    discountPrice: 0.00,
    colorlabel: colour,
    image: 'assets/images/fruit.jpg'
  ),
  Product(
    id: 5,
    title: 'ginger',
    category: cate_list,
    price: 20.00,
    discountPrice: 10.00,
    colorlabel: colour,
    image: 'assets/images/fruit.jpg'
  ),
];
