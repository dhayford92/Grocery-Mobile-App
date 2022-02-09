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

  Colorlabel({this.id, this.title, required this.haxCode});

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


/*

Default list of the models

*/



//list of colors
List<Colorlabel> colour=[
  Colorlabel(
    title: 'green',
    haxCode: '0xff61D095',
  ),
  Colorlabel(
    title: 'pitch',
    haxCode: '0xffDFB9D6',
  ),
  Colorlabel(
    title: 'yellow',
    haxCode: '0xffFBE689',
  ),
  Colorlabel(
    title: 'red',
    haxCode: '0xffEF8089',
  ),
  Colorlabel(
    title: 'purple',
    haxCode: '0xffCE78C0',
  ),
];
String des =
    'Something to describ the product here, Something to describ the product here, Something to describ the product here';

List<Product> prod_list = [
  Product(
    id: 0,
    title: 'Apple',
    description: des,
    category: cate_list,
    price: 12.00,
    colorlabel: colour[0],
    discountPrice: 0.00,
    image: 'assets/images/fruit.jpg',
    isActive: true,
    quantity: 12,
  ),
  Product(
    id: 1,
    title: 'Banana',
    description: des,
    category: cate_list,
    price: 12.00,
    discountPrice: 10.00,
    colorlabel: colour[3],
    image: 'assets/images/fruit.jpg',
    isActive: false,
    quantity: 2,
  ),
  Product(
    id: 2,
    title: 'Pear',
    description: des,
    category: cate_list,
    price: 12.00,
    discountPrice: 0.00,
    colorlabel: colour[2],
    image: 'assets/images/fruit.jpg',
    isActive: true,
    quantity: 1,
  ),
  Product(
    id: 3,
    title: 'Mango',
    description: des,
    category: cate_list,
    price: 12.00,
    discountPrice: 8.00,
    colorlabel: colour[1],
    image: 'assets/images/fruit.jpg',
    isActive: false,
    quantity: 4,
  ),
  Product(
    id: 4,
    title: 'Tomato',
    description: des,
    category: cate_list,
    price: 15.00,
    discountPrice: 0.00,
    colorlabel: colour[4],
    image: 'assets/images/fruit.jpg',
    isActive: true,
    quantity: 10,
  ),
  Product(
    id: 5,
    title: 'ginger',
    description: des,
    category: cate_list,
    price: 20.00,
    discountPrice: 10.00,
    colorlabel: colour[2],
    image: 'assets/images/fruit.jpg',
    isActive: false,
    quantity: 2,
  ),
];
