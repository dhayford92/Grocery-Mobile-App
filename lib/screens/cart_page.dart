import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/screens/checkout.dart';
import 'package:grocerymobileapp/widgets/cartitem_card.dart';

import '../constant.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //variable for total
  double total = 0.00;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; cartItem.length - 1 >= i; i++) {
      total += cartItem[i].totalPrice!;
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
                child: cartItem.isEmpty
                    ? Center(
                        child: Text(
                        'No items added, please keep shopping',
                        softWrap: true,
                        style: Theme.of(context).textTheme.subtitle1,
                      ))
                    : ListView.builder(
                        itemCount: cartItem.length,
                        itemBuilder: (_, index) {
                          return CartItemCard(cartItem: cartItem[index]);
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
                    'Items: ( ${cartItem.length} )',
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
                onPress: () =>
                    Navigator.of(context).pushNamed(CheckoutScreen.id),
              ),
            ),
          )
        ],
      )),
    );
  }
}
