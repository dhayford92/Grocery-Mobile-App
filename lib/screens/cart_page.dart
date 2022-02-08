import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/models/cartitem_model.dart';
import 'package:grocerymobileapp/models/product_model.dart';
import 'package:grocerymobileapp/widgets/cartitem_card.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //cart list
  final List<CartItem> _cartItem = [
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

  //variable for total
  double total = 0.00;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; _cartItem.length - 1 >= i; i++) {
      total += _cartItem[i].totalPrice!;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Cart Items',
          style: TextStyle(fontWeight: FontWeight.bold, color: primaryColour),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: primaryColour),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Expanded(
              child: SizedBox(
                width: mediaSize(context).width * 1,
                height: mediaSize(context).height / 1.5,
                child: ListView.builder(
                    itemCount: _cartItem.length,
                    itemBuilder: (_, index) {
                      return CartItemCard(cartItem: _cartItem[index]);
                    }),
              ),
            ),
          ),
          //total price and total items
          Positioned(
              top: mediaSize(context).height / 1.2 - 100,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Items: ( ${_cartItem.length} )',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Total: ${total}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              )),
          //button
          Padding(
            padding: EdgeInsets.only(
                top: mediaSize(context).height / 1.2 - 10,
                left: 30,
                bottom: 10,
                right: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                  icon: Icons.check_box_outlined,
                  title: 'Checkout',
                  onPress: () {}),
            ),
          )
        ],
      )),
    );
  }
}
