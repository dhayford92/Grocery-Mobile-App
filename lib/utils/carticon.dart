import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/screens/cart_page.dart';

class CartIcon extends StatefulWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  _CartIconState createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.id);
          },
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: primaryColour,
            size: 27,
          ),
        ),
        const Positioned(
          top: 5,
          right: 5,
          child: Text(
            '0',
            style: TextStyle(
              color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
