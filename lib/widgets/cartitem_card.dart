import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/models/cartitem_model.dart';

class CartItemCard extends StatelessWidget {
  CartItem cartItem;
  CartItemCard({
    required this.cartItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: primaryColour)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //image, title and price
            Row(
              children: [
                //image
                SizedBox(
                  height: 80,
                  width: 90,
                  child: Image.asset('${cartItem.product!.image}'),
                ),
                const SizedBox(width: 10),
                //name and price
                Column(
                  children: [
                    Text(
                      '${cartItem.product!.title}',
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Ghc ${cartItem.product!.price}',
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
            //quantity
            Text(
              'Qty: ${cartItem.quantity}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            //close icon and sub total
            Column(
              children: [
                //close icon
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close, color: Colors.red),),
                const SizedBox(height: 10),
                //sub total
                Text(
                  'sub total: ${cartItem.totalPrice}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
