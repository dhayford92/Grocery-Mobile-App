import 'package:flutter/material.dart';

import 'models/cartitem_model.dart';
import 'models/category_model.dart';
import 'models/order_model.dart';
import 'models/product_model.dart';

/*

Default list of the models

*/
// list of categories
List<Category> cate_list = [
  Category(id: 0, title: "Vagetables"),
  Category(id: 1, title: 'Fruit'),
  Category(id: 2, title: 'Nuts and Beans'),
  Category(id: 3, title: 'Dry'),
];

//list of colors
List<Colorlabel> colour = [
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

//product list
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
//
//
// -- cart list -- //
List<CartItem> cartItem = [
  CartItem(
    id: 0,
    totalPrice: 230,
    product: prod_list[0],
    quantity: 2,
  ),
  CartItem(
    id: 1,
    totalPrice: 120,
    product: prod_list[1],
    quantity: 1,
  ),
];
//
//
// -- order list -- //
List<Order> order_list = [
  Order(
    id: 0,
    orderID: '1A2S5DF37',
    total: '200.00',
    orderType: OrderType.Delivery,
    orderStatus: OrderStatus.Pending,
    updated: '12-02-2022, 3:40',
    items: cartItem,
  ),
  Order(
    id: 1,
    orderID: '1A3K4LL26Y',
    total: '2320.00',
    orderType: OrderType.Delivery,
    orderStatus: OrderStatus.Sending,
    updated: '13-01-2022, 3:10',
    items: cartItem,
  ),
  Order(
    id: 1,
    orderID: '1A2S5DE6Y',
    total: '200.00',
    orderType: OrderType.Delivery,
    orderStatus: OrderStatus.Cancelled,
    updated: '13-01-2022, 3:40',
    items: cartItem,
  ),
  Order(
    id: 2,
    orderID: '1A2SE6Y37',
    total: '200.00',
    orderType: OrderType.Delivery,
    orderStatus: OrderStatus.Refund,
    updated: '12-01-2022, 3:40',
    items: cartItem,
  ),
  Order(
    id: 3,
    orderID: '1E6Y5DF37',
    total: '200.00',
    orderType: OrderType.PickUp,
    orderStatus: OrderStatus.ReadyPickup,
    updated: '10-01-2022, 1:40',
    items: cartItem,
  ),
  Order(
    id: 4,
    orderID: '1AE6YDF37',
    total: '200.00',
    orderType: OrderType.Delivery,
    orderStatus: OrderStatus.Delivered,
    updated: '20-10-2021, 2:10',
    items: cartItem,
  )
];
//
//
// -- rating icons -- //
List<Icon> icons_list = [];
List<Icon> emp_icons_list = [
  Icon(
    Icons.star_outlined,
    size: 10,
    color: Colors.yellow[900],
  ),
  Icon(
    Icons.star_outlined,
    size: 10,
    color: Colors.yellow[900],
  ),
  Icon(
    Icons.star_outlined,
    size: 10,
    color: Colors.yellow[900],
  ),
  Icon(
    Icons.star_outlined,
    size: 10,
    color: Colors.yellow[900],
  ),
  Icon(
    Icons.star_outlined,
    size: 10,
    color: Colors.yellow[900],
  ),
];
//
//
// -- favorite -- //
List<Favorite> fav_list = [
  Favorite(
    id: 0,
    product: prod_list[0],
  ),
  Favorite(
    id: 0,
    product: prod_list[3],
  ),
  Favorite(
    id: 0,
    product: prod_list[1],
  ),
  Favorite(
    id: 0,
    product: prod_list[5],
  ),
];
